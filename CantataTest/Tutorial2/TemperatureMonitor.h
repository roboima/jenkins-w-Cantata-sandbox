#ifndef TEMPERATURE_MONITOR_H_
#define TEMPERATURE_MONITOR_H_

#define COOLING_ADJUSTMENT_STEP_SIZE 3
#define COOLING_LEVEL_MAX 200

#define TEMP_IDEAL 40
#define TEMP_RECOMMENDED_MAX 60
#define TEMP_CRITICAL_MAX 80

extern float therm_getReading();
extern void cool_increaseCooling(int increaseAmount);
extern void sys_triggerCriticalShutdown();

void monitorTemperature();

#endif /* TEMPERATURE_MONITOR_H_ */
