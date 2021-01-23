#include "TemperatureMonitor.h"

void monitorTemperature()
{
    float currentTemperature = therm_getReading();

    if (currentTemperature > TEMP_CRITICAL_MAX)
    {
        sys_triggerCriticalShutdown();
    }
    else if (currentTemperature > TEMP_RECOMMENDED_MAX)
    {
        cool_increaseCooling(COOLING_LEVEL_MAX);
    }
    else if (currentTemperature > TEMP_IDEAL)
    {
        cool_increaseCooling(COOLING_ADJUSTMENT_STEP_SIZE);
    }
}
