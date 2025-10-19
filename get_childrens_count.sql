--Возвращает число дочерних элементов для каждой из категорий товаров
select c1.name as "Группа", coalesce(count(c2.id), 0) as "Число"
from category c1
left join category c2
on c1.id = c2.parent_id
group by c1.name, c1.id
order by c1.id 
