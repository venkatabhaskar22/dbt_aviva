select * from 
    {{ref('stg_customer')}}
where salary_employee <0