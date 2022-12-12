{% macro ref_for_test(model_name) %}
 
      {%- set normal_ref_relation = ref(model_name) -%}
      {%- set test_ref_relation = this -%}

      {% if target.name == 'unit-test' %}

            {%- set test_ref = adapter.get_relation(
                  database = test_ref_relation.database,
                  schema = 'unit_testing',
                  identifier = 'test_' ~ test_ref_relation.identifier) 
            -%}
            
            {{ return(test_ref) }}

      {% else %}
      
            {{ return(normal_ref_relation) }}
      
      {% endif %}
 
{% endmacro %}