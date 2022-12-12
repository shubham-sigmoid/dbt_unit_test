{% macro source_for_test(source_schema, source_name) %}

      {%- set normal_source_relation = source(source_schema, source_name) -%}
      {%- set test_ref_relation = this -%}

      {% if 'unit-test' in target.name %}

            {% set suffix = target.name|replace('unit-test_','_') %}

            
            
            {%- set test_source_relation = source('test_' ~ source_schema, 'test_' ~ source_name ~ suffix)
            -%}

            {{ return(test_source_relation) }}

      {% else %}

            {{ return(normal_source_relation) }}

      {% endif %}

{% endmacro %}