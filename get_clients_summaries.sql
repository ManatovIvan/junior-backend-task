--Запрос возвращает общее число заказанных клиентом товаров и сумму, потраченную на них
select c.name as "Наименование клиента", sum(oc.quantity) as "Число товаров", sum(oc.quantity*n.price) as "Сумма заказов"
from client c 
left join orders o on o.client_id = c.id 
left join order_content oc on o.id = oc.order_id
left join nomenclature n on oc.nomenclature_id = n.id
group by c.name 
--Не очень понятно тз, сумма товаров по их количеству, или сумма по цене заказа. Сделал и то, и то
