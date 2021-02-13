#ifndef TEMPERATURE_MONITOR_H_
#define TEMPERATURE_MONITOR_H_

typedef float temperatureReading_t;

#define TEMP_CRITICAL_MAX 80
#define TEMP_RECOMMENDED_MAX 60
#define TEMP_IDEAL 40
#define TEMP_RECOMMENDED_MIN 20
#define TEMP_CRITICAL_MIN 5
#define TEMP_VARIATION_TOLERANCE 3

#define COOLING_LEVEL_MAX 200
#define COOLING_LEVEL_MIN 0
#define COOLING_ADJUSTMENT_STEP_SIZE 3

#define TEMPERATURE_READING_POOL_SIZE 5

temperatureReading_t updateTemperaturePool();
temperatureReading_t calculateAverageTemperature();
void monitorTemperature();

#endif /* TEMPERATURE_MONITOR_H_ */
