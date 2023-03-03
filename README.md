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
