//: [Previous](@previous)

/*
 
 355. Design Twitter
 
 Design a simplified version of Twitter where users can post tweets, follow/unfollow another user and is able to see the 10 most recent tweets in the user's news feed. Your design should support the following methods:

 postTweet(userId, tweetId): Compose a new tweet.
 getNewsFeed(userId): Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent.
 follow(followerId, followeeId): Follower follows a followee.
 unfollow(followerId, followeeId): Follower unfollows a followee.
 Example:

 Twitter twitter = new Twitter();

 // User 1 posts a new tweet (id = 5).
 twitter.postTweet(1, 5);

 // User 1's news feed should return a list with 1 tweet id -> [5].
 twitter.getNewsFeed(1);

 // User 1 follows user 2.
 twitter.follow(1, 2);

 // User 2 posts a new tweet (id = 6).
 twitter.postTweet(2, 6);

 // User 1's news feed should return a list with 2 tweet ids -> [6, 5].
 // Tweet id 6 should precede tweet id 5 because it is posted after tweet id 5.
 twitter.getNewsFeed(1);

 // User 1 unfollows user 2.
 twitter.unfollow(1, 2);

 // User 1's news feed should return a list with 1 tweet id -> [5],
 // since user 1 is no longer following user 2.
 twitter.getNewsFeed(1);
 
 */

import Foundation

struct User {
    var id: Int
    var followed: Set<Int>
    var tweets: [Tweet]
    init(_ id: Int) {
        self.id = id
        followed = []
        tweets = []
    }
}

struct Tweet {
    var id: Int
    var poster: Int
    var timestamp: Int
    init(_ id: Int, _ poster: Int, _ timestamp: Int) {
        self.id = id
        self.poster = poster
        self.timestamp = timestamp
    }
}
/*
 
 ["Twitter","postTweet","getNewsFeed","follow","postTweet","getNewsFeed","unfollow","getNewsFeed"]
 [[],[1,5],[1],[1,2],[2,6],[1],[1,2],[1]]
 */
class Twitter {
    private var timestamp: Int
    private var users: [Int: User]

    /** Initialize your data structure here. */
    init() {
        timestamp = 0
        users = [:]
    }
    
    /** Compose a new tweet. */
    func postTweet(_ userId: Int, _ tweetId: Int) {
        let tweet = Tweet(tweetId, userId, timestamp)
        if users[userId] != nil {
            users[userId]!.tweets.append(tweet)
        } else {
            var user = User(userId)
            user.tweets.append(tweet)
            users[userId] = user
        }
        timestamp += 1
        
    }
    
    /** Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent. */
    func getNewsFeed(_ userId: Int) -> [Int] {
        guard let user = users[userId] else { return [] }
        let mine = user.tweets
        let subscribes = user.followed.reduce([]) { (res, id) -> [Tweet] in
            if let user = users[id] {
                return res + user.tweets
            }
            return res
        }
        
        var tweets = mine + subscribes
        tweets.sort { (t1, t2) -> Bool in
            t1.timestamp > t2.timestamp
        }
        let size = tweets.count
        if size > 10 {
            return Array(tweets[0..<10].map{ $0.id })
        }
        return tweets.map{ $0.id }
    }
    
    /** Follower follows a followee. If the operation is invalid, it should be a no-op. */
    func follow(_ followerId: Int, _ followeeId: Int) {
        guard followerId != followeeId else { return }
        if users[followerId] != nil {
            users[followerId]!.followed.insert(followeeId)
        } else {
            var me = User(followerId)
            me.followed.insert(followeeId)
            users[followerId] = me
        }
        if users[followeeId] == nil {
            users[followeeId] = User(followeeId)
        }
    }
    
    /** Follower unfollows a followee. If the operation is invalid, it should be a no-op. */
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        if users[followerId] != nil {
            users[followerId]!.followed.remove(followeeId)
        } else {
            users[followerId] = User(followerId)
        }
        if users[followeeId] == nil {
            users[followeeId] = User(followeeId)
        }
    }
    
}

let twitter = Twitter()
twitter.postTweet(1, 5)
//twitter.getNewsFeed(1)
twitter.follow(1, 2)
twitter.postTweet(2, 6)
twitter.getNewsFeed(1)

/**
 * Your Twitter object will be instantiated and called as such:
 * let obj = Twitter()
 * obj.postTweet(userId, tweetId)
 * let ret_2: [Int] = obj.getNewsFeed(userId)
 * obj.follow(followerId, followeeId)
 * obj.unfollow(followerId, followeeId)
 */

//: [Next](@next)
