/*****************************************************************************/
/*                            Cantata Test Script                            */
/*****************************************************************************/
/*
 *    Filename: test_TemperatureMonitor.c
 *    Author: roboima
 *    Generated on: 06-Jan-2021 11:42:50
 *    Generated from: TemperatureMonitor.c
 */
/*****************************************************************************/
/* Environment Definition                                                    */
/*****************************************************************************/

#define TEST_SCRIPT_GENERATOR 2

/* Include files from software under test */
#include <malloc.h>
#include <stddef.h>
#include "../../../TemperatureMonitor.h"
#include "../../../SensorArray.h"
#include "../../../CoolingControl.h"
#include "../../../SystemController.h"

#define CANTATA_DEFAULT_VALUE 0 /* Default value of variables & stub returns */

#include <cantpp.h>  /* Cantata Directives */
/* pragma qas cantata testscript start */
/*****************************************************************************/
/* Global Data Definitions                                                   */
/*****************************************************************************/

/* Global Functions */
extern temperatureReading_t updateTemperaturePool();
extern temperatureReading_t calculateAverageTemperature();
void sys_triggerCriticalShutdown();
void cool_increaseCooling(int increaseAmount);
void cool_decreaseCooling(int decreaseAmount);
float therm_getReading();
extern void monitorTemperature();

/* Global data */
extern temperatureReading_t temperature_pool[5];

/* Expected variables for global data */
temperatureReading_t expected_temperature_pool[5];

/* This function initialises global data to default values. This function       */
/* is called by every test case so must not contain test case specific settings */
static void initialise_global_data(){
    INITIALISE(temperature_pool);
}

/* This function copies the global data settings into expected variables for */
/* use in check_global_data(). It is called by every test case so must not   */
/* contain test case specific settings.                                      */
static void initialise_expected_global_data(){
    COPY_TO_EXPECTED(temperature_pool, expected_temperature_pool);
}

/* This function checks global data against the expected values. */
static void check_global_data(){
    CHECK_MEMORY("temperature_pool", temperature_pool, expected_temperature_pool, sizeof(expected_temperature_pool));
}

/* Prototypes for test functions */
void run_tests();
void test_monitorTemperature(int);
void test_monitorTemperature_1(int);

/*****************************************************************************/
/* Program Entry Point                                                       */
/*****************************************************************************/
int main()
{
    OPEN_LOG("test_TemperatureMonitor.ctr", false, 100);
    START_SCRIPT("TemperatureMonitor", true);

    run_tests();

    return !END_SCRIPT(true);
}

/*****************************************************************************/
/* Test Control                                                              */
/*****************************************************************************/
/* run_tests() contains calls to the individual test cases, you can turn test*/
/* cases off by adding comments*/
void run_tests()
{
    test_monitorTemperature(1);
    test_monitorTemperature_1(1);
}

/*****************************************************************************/
/* Test Cases                                                                */
/*****************************************************************************/

void test_monitorTemperature(int doIt){
if (doIt) {
    /* Set global data */
    initialise_global_data();
    /* Set expected values for global data checks */
    initialise_expected_global_data();
    {
    /* Test case data declarations */

    START_TEST("test_monitorTemperature",
               "<Insert test case description here>");

        /* Expected Call Sequence  */
        EXPECT_CALL("updateTemperaturePool", "others", "critical_min");
        EXPECT_CALL("sys_triggerCriticalShutdown", "others", "default");

            /* Call SUT */
            monitorTemperature();

            /* Test case checks */
            /* Checks on global data */
            check_global_data();
        END_CALLS();
    END_TEST();
}}}

void test_monitorTemperature_1(int doIt){
if (doIt) {
    /* Set global data */
    initialise_global_data();
    /* Set expected values for global data checks */
    initialise_expected_global_data();
    {
    /* Test case data declarations */

    START_TEST("test_monitorTemperature_1",
               "<Insert test case description here>");

        /* Expected Call Sequence  */
        EXPECT_CALL("updateTemperaturePool", "others", "below_recommended_temp");
        EXPECT_CALL("cool_decreaseCooling", "others", "default");

            /* Call SUT */
            monitorTemperature();

            /* Test case checks */
            /* Checks on global data */
            check_global_data();
        END_CALLS();
    END_TEST();
}}}

/*****************************************************************************/
/* Call Interface Control                                                    */
/*****************************************************************************/

/* Stub for function sys_triggerCriticalShutdown */
void sys_triggerCriticalShutdown(){
    REGISTER_CALL("sys_triggerCriticalShutdown");

    IF_INSTANCE("default") {
        return;
    }

    LOG_SCRIPT_ERROR("Call instance not defined.");
    return;
}

/* Stub for function cool_increaseCooling */
void cool_increaseCooling(int increaseAmount){
    REGISTER_CALL("cool_increaseCooling");

    IF_INSTANCE("default") {
        return;
    }

    LOG_SCRIPT_ERROR("Call instance not defined.");
    return;
}

/* Stub for function cool_decreaseCooling */
void cool_decreaseCooling(int decreaseAmount){
    REGISTER_CALL("cool_decreaseCooling");

    IF_INSTANCE("default") {
        return;
    }

    LOG_SCRIPT_ERROR("Call instance not defined.");
    return;
}

/* Stub for function therm_getReading */
float therm_getReading(){
    REGISTER_CALL("therm_getReading");

    IF_INSTANCE("default") {
        return CANTATA_DEFAULT_VALUE;
    }

    LOG_SCRIPT_ERROR("Call instance not defined.");
    return CANTATA_DEFAULT_VALUE;
}

#pragma qas cantata ignore on

/* Before-Wrapper for function updateTemperaturePool */
int BEFORE_updateTemperaturePool(){
    REGISTER_CALL("updateTemperaturePool");

    IF_INSTANCE("default") {
        return AFTER_WRAPPER;
    }
    IF_INSTANCE("critical_min") {
        return REPLACE_WRAPPER;
    }
    IF_INSTANCE("below_recommended_temp") {
        return REPLACE_WRAPPER;
    }

    LOG_SCRIPT_ERROR("Call instance not defined.");
    return AFTER_WRAPPER;
}

/* After-Wrapper for function updateTemperaturePool */
temperatureReading_t AFTER_updateTemperaturePool(temperatureReading_t cppsm_return_value){
    IF_INSTANCE("default") {
        return cppsm_return_value;
    }

    LOG_SCRIPT_ERROR("Call instance not defined.");
    return cppsm_return_value;
}

/* Replace-Wrapper for function updateTemperaturePool */
temperatureReading_t REPLACE_updateTemperaturePool(){

    IF_INSTANCE("critical_min") {
        return 3;
    }
    IF_INSTANCE("below_recommended_temp") {
        return 10;
    }
    LOG_SCRIPT_ERROR("Call instance not defined.");
    return CANTATA_DEFAULT_VALUE;
}

/* Before-Wrapper for function calculateAverageTemperature */
int BEFORE_calculateAverageTemperature(){
    REGISTER_CALL("calculateAverageTemperature");

    IF_INSTANCE("default") {
        return AFTER_WRAPPER;
    }

    LOG_SCRIPT_ERROR("Call instance not defined.");
    return AFTER_WRAPPER;
}

/* After-Wrapper for function calculateAverageTemperature */
temperatureReading_t AFTER_calculateAverageTemperature(temperatureReading_t cppsm_return_value){
    IF_INSTANCE("default") {
        return cppsm_return_value;
    }

    LOG_SCRIPT_ERROR("Call instance not defined.");
    return cppsm_return_value;
}

/* Replace-Wrapper for function calculateAverageTemperature */
temperatureReading_t REPLACE_calculateAverageTemperature(){

    LOG_SCRIPT_ERROR("Call instance not defined.");
    return CANTATA_DEFAULT_VALUE;
}

#pragma qas cantata ignore off
/* pragma qas cantata testscript end */
/*****************************************************************************/
/* End of test script                                                        */
/*****************************************************************************/
