#include <malloc.h>
#include <stddef.h>

#include "TemperatureMonitor.h"
#include "SensorArray.h"
#include "CoolingControl.h"
#include "SystemController.h"

temperatureReading_t temperature_pool[TEMPERATURE_READING_POOL_SIZE];

void monitorTemperature()
{
    temperatureReading_t currentTemp = updateTemperaturePool();

    if (currentTemp >= TEMP_CRITICAL_MAX ||
            currentTemp <= TEMP_CRITICAL_MIN)
    {
        sys_triggerCriticalShutdown();
    }
    else if (currentTemp >= TEMP_RECOMMENDED_MAX)
    {
        cool_increaseCooling(COOLING_LEVEL_MAX);
    }
    else if (currentTemp <= TEMP_RECOMMENDED_MIN)
    {
        cool_decreaseCooling(COOLING_LEVEL_MAX);
    }
    else
    {
        temperatureReading_t recentAverage = calculateAverageTemperature();
        if (recentAverage > (TEMP_IDEAL + TEMP_VARIATION_TOLERANCE) )
        {
            cool_increaseCooling(COOLING_ADJUSTMENT_STEP_SIZE);
        }
        else if (recentAverage < (TEMP_IDEAL - TEMP_VARIATION_TOLERANCE) )
        {
            cool_decreaseCooling(COOLING_ADJUSTMENT_STEP_SIZE);
        }
        /* else operating at recommended temperature, do nothing. */
    }
}

temperatureReading_t updateTemperaturePool()
{
    static int pool_ptr = 0; /* used to save our place in the pool */

    /* get reading and add it to the next location in the pool */
    temperatureReading_t thisReading = therm_getReading();
    temperature_pool[pool_ptr] = thisReading;

    /* progress the pointer for next time and constrain it to the size of the pool */
    pool_ptr = pool_ptr + 1;
    pool_ptr %= TEMPERATURE_READING_POOL_SIZE;

    /* return the reading we took this time */
    return temperature_pool[pool_ptr];
}

temperatureReading_t calculateAverageTemperature()
{
    temperatureReading_t totalTemperatures = 0;

    int i;
    for (i = 0; i < TEMPERATURE_READING_POOL_SIZE; ++i)
    {
        totalTemperatures += temperature_pool[i];
    }
    return totalTemperatures / TEMPERATURE_READING_POOL_SIZE;
}
