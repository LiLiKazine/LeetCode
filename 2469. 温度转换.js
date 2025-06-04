/**
 * @param {number} celsius
 * @return {number[]}
 */
var convertTemperature = function(celsius) {
    const kevin = celsius + 273.15;
    const fahrenheit = celsius * 1.80 + 32.00;
    return [kevin, fahrenheit];
};