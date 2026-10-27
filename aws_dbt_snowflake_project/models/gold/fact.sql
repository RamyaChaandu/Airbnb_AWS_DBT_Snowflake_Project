{% set congigs = [
    {
        "table":"AIRBNB.GOLD.obt",
        "columns":"GOLD_obt.BOOKING_ID,GOLD_obt.LISTING_ID,GOLD_obt.HOST_ID, GOLD_obt.TOTAL_AMOUNT,GOLD_obt.CLEANING_FEE,GOLD_obt.SERVICE_FEE, GOLD_obt.ACCOMMODATES,	GOLD_obt.BEDROOMS,GOLD_obt.	BATHROOMS,	GOLD_obt.PRICE_PER_NIGHT,	GOLD_obt.RESPONSE_RATE",
        "alias":"GOLD_obt",
    },

    {
        "table":"AIRBNB.GOLD.DIM_LISTINGS",
        "columns":" ",
        "alias":"dim_listings",
        "join condition":"gold_obt.listing_id=dim_listings.listing_id"
    },

    {
        "table":"AIRBNB.GOLD.DIM_HOSTS",
        "columns":" ",
        "alias":"dim_hosts",
        "join condition":"gold_obt.host_id=dim_hosts.host_id"
    }
] %}



SELECT
    
        {{ congigs[0]['columns'] }}

FROM
    {% for config in congigs %}
        {% if loop.first %}
            {{ config['table'] }} AS {{ config['alias'] }}
        {% else %}
            LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
            ON {{ config['join condition'] }}
        {% endif %}
    {% endfor %}