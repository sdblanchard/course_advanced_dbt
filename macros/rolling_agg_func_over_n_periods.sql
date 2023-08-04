{% macro rolling_agg_func_over_n_periods(agg_func, column_name, partition_by, order_by, n) %}
    {{ agg_func }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ n-1 }} PRECEDING AND CURRENT ROW
            ) AS {{agg_func}}_{{ n }}_periods_{{ column_name }}
{% endmacro %}
