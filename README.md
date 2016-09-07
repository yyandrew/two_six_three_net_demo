# This is just a demo

## Generate test data

``` ruby
rake db:create
rake db:migrate
rake db:seed
```

## Available APIs

### Department

#### Request

- HTTP Method: GET
- URL: http://localhost:3000/departments.json

#### Response

- Status: 200 OK
- Body:

  ```js
    [
      {
        "id": 1,
        "name": "Clothing",
        "description": "Consequatur molestias voluptates est nostrum.",
        "employees": [
          {
            "id": 1,
            "name": "Ms. Kay Cormier",
            "role": "manager",
            "age": 58,
            "gender": "male",
            "phone": "680.937.6380",
            "address": "64704 Lynch Fort"
          },
          {
            "id": 2,
            "name": "Coleman Medhurst",
            "role": "manager",
            "age": 58,
            "gender": "male",
            "phone": "(502) 542-1631",
            "address": "2063 Meggie Tunnel"
          },
          {
            "id": 3,
            "name": "Hardy Crona MD",
            "role": "manager",
            "age": 58,
            "gender": "male",
            "phone": "854-432-4923",
            "address": "2547 Stacey Passage"
          }
        ]
      }
    ]
  ```

#### Request

- HTTP Method: GET
- URL: http://localhost:3000/departments/1.json

#### Response

- Status: 200 OK
- Body:

  ```js
    {
      "id": 1,
      "name": "Clothing",
      "description": "Consequatur molestias voluptates est nostrum.",
      "employees": [
        {
          "name": "Ms. Kay Cormier",
          "role": "manager",
          "age": 58,
          "gender": "male",
          "phone": "680.937.6380",
          "address": "64704 Lynch Fort"
        },
        {
          "name": "Coleman Medhurst",
          "role": "manager",
          "age": 58,
          "gender": "male",
          "phone": "(502) 542-1631",
          "address": "2063 Meggie Tunnel"
        },
        {
          "name": "Hardy Crona MD",
          "role": "manager",
          "age": 58,
          "gender": "male",
          "phone": "854-432-4923",
          "address": "2547 Stacey Passage"
        }
      ]
    }
  ```

### Employee

#### Request

- HTTP Method: GET
- URL: http://localhost:3000/employees.json

#### Response

- Status: 200 OK
- Body:

  ```js
    [
      {
        "id": 1,
        "name": "Ms. Kay Cormier",
        "role": "manager",
        "age": 58,
        "gender": "male",
        "phone": "680.937.6380",
        "address": "64704 Lynch Fort",
        "departments": [
          {
            "name": "Clothing"
          }
        ]
      },
      {
        "id": 2,
        "name": "Coleman Medhurst",
        "role": "manager",
        "age": 58,
        "gender": "male",
        "phone": "(502) 542-1631",
        "address": "2063 Meggie Tunnel",
        "departments": [
          {
            "name": "Clothing"
          }
        ]
      },
      ...
    ]
  ```

#### Request

- HTTP Method: GET
- URL: http://localhost:3000/employees/1.json

#### Response

- Status: 200 OK
- Body:

  ```js
    {
      "id": 1,
      "name": "Ms. Kay Cormier",
      "role": "manager",
      "age": 58,
      "gender": "male",
      "phone": "680.937.6380",
      "address": "64704 Lynch Fort",
      "departments": [
        {
          "name": "Clothing"
        }
      ]
    }
  ```
