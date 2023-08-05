{% macro subscriber_months(user_id, subscription_id, model, first_start_month, last_end_month) %}

    SELECT
       {{model}}.{{user_id}},
        {{model}}.{{subscription_id}},
        months.date_month
    FROM
        {{model}}
        INNER JOIN (
        SELECT
            calendar_date AS date_month
        FROM
            {{ ref('dim_dates') }}
        WHERE
            day_of_month = 1
        ) months
            -- All months after start date
            ON months.date_month >= {{model}}.{{first_start_month}}
                -- and before end date
                AND months.date_month < {{model}}.{{last_end_month}}
{% endmacro %}
