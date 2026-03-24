# Karate Standalone API Tests

This directory contains Karate tests for the Ping Service, runnable independently of Maven.

## How to Run

1. Download the latest `karate.jar` from [Karate Labs](https://github.com/karatelabs/karate/releases) and place it in this directory (or a `lib/` subdirectory).

2. Start your Spring Boot service (so the API is available at http://localhost:8080).

3. Run the tests:

   ```sh
   java -jar karate.jar ping.feature
   ```
   or, if using a `lib/` subdirectory:
   ```sh
   java -jar lib/karate.jar ping.feature
   ```

## Notes
- You can add more `.feature` files for other endpoints or services.
- This setup is backend-agnostic and does not require Maven or JUnit integration.
