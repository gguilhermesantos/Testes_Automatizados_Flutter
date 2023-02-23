var reporter = require('cucumber-html-reporter');

var d = new Date();

data = (            d.toLocaleDateString("pt-br", { year: 'numeric' }) 
            + "-" + d.toLocaleDateString("pt-br", { month: '2-digit' })
            + "-" + d.toLocaleDateString("pt-br", { day: '2-digit' })
            + "_" + d.toLocaleTimeString("pt-br", { hour: 'numeric' })
            + ":" + d.toLocaleTimeString("pt-br", { minute: '2-digit' }) );

var options = {
        theme: 'bootstrap',
        jsonFile: 'integration_test/reports/cucumber_report.json',
        output: `integration_test/reports/_reports/Report_${data}.html`,
        reportSuiteAsScenarios: true,
        scenarioTimestamp: true,
        launchReport: true,
    };

reporter.generate(options);