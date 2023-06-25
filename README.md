# Good Night

## Features
1. Clock In operation, and return all clocked-in times, ordered by created time.
2. Users can follow and unfollow other users.
3. See the sleep records of a user’s All following users’ sleep records. from the previous week, which are sorted based on the duration of All friends sleep length.
This is a 3rd requirement response example
{
  record 1 from user A,
  record 2 from user B,
  record 3 from user A,
  ...
}
4. No need to implement any user registration API.

### System version
- Ruby  `3.2.2`
- Rails `7.0.5`

## How To Run Locally
* Ensure mySQL is already running
* Adjust config/database.yml according to your DB setup
* Run `bin/rails db:create`
* Run `bin/rails db:migrate`
* Run `bin/rails db:seed`
* Run `bin/rails s`

## Available API end-points
### Follow/Unfollow a User
  * API end-point: `PUT /user/:user_id/follow|unfollow/:follower_id`
  * Request body: `{}`
  * Response body:
  ```json
                  {
                        "msg": "User was follow/unfollow",
                        "data": {}
                    }
  ```
  * Response code: 200

### Sleep Clock-In and Clock-Out
  * API end-point: `POST /sleep_record`
  * Request body: `{"user_id": 4, "clock_in": "2023-06-25 08:00:00", "clock_out": "2023-06-25 09:00:00"}`
  * Response body:
    ```json
                    {
                        "msg": "Clock has been saved",
                        "data": {}
                    }
    ```
  * Response code: 200

### Get Friends' Sleep Records
  * API end-point: `GET /user/:user_id/user_follower`
  * Request body: `{}`
  * Response body:
    ```json
          {
          "msg": "OK",
          "data": [
              {
                  "id": 2,
                  "user": "Ann",
                  "clocked_in": "2023-06-12T00:00:00.000Z",
                  "clocked_out": "2023-06-25T02:08:44.489Z",
                  "duration": 10800
              }
          ]
      }
    ```
  * Response code: 200
