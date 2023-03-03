## Endpoints

<details close>
<summary>Get Customer Subscriptions</summary>
<br>

Request: <br>
```
GET /api/v1/customer/#{customer_id}/subscriptions
```

JSON Response Example:
```json
{
    "data": [
        {
            "id": "7",
            "type": "subscription",
            "attributes": {
                "customer_id": 7,
                "tea_id": 10,
                "price": 5.99,
                "frequency_monthly": 5
            }
        },
        {
            "id": "8",
            "type": "subscription",
            "attributes": {
                "customer_id": 7,
                "tea_id": 11,
                "price": 2.5,
                "frequency_monthly": 10
            }
        },
        {...},
        {...},
    ]
}
```
</details>

<details close>
<summary>Delete Subscription</summary>
<br>

Request: <br>
```
DELETE /api/v1/customer/#{customer_id}/subscriptions/#{subscription_id}
```

JSON Response Example:
```json
{
    "message": "The subscription was successfully deleted"
}
```
</details>

<details close>
<summary>Create Subscription</summary>
<br>

Request: <br>
```
POST /api/v1/customer/#{customer_id}/subscriptions
```

Request Body Example: <br>
```json
{
  "tea_id": 2,
  "price": 5.99,
  "frequency_monthly": 2
}
```

JSON Response Example:
```json
{
  "data":
      {
          "id": "7",
          "type": "subscription",
          "attributes": {
              "customer_id": 7,
              "tea_id": 2,
              "price": 5.99,
              "frequency_monthly": 2
          }
      }
}
```
</details>

## Schema

![Screenshot 2023-03-03 at 4 24 11 AM](https://user-images.githubusercontent.com/110333328/222696371-0de2d0c0-bf47-4327-9a19-0fa46684b478.png)
