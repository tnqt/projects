Feature: Splash

    Scenario: The Splash just started
        Given the app is running
        Then I see Splash page
        And I see Logo Image
        And I see {LinearProgressIndicator} widget