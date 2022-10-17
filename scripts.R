customers %>%
  count(customer_unique_id) %>%
  arrange(desc(n))


idmost <- "8d50f5eadf50201ccdcedfb9e2ac8455"

sniping<- customers %>%
  full_join(orders) %>%
  full_join(order_items)%>%
  full_join(order_payments)%>%
  filter(customer_unique_id == idmost)

bar<-ggplot(sniping) +
  aes(x = order_id, y = price) +
  geom_col(fill = "#112446") +
  theme_minimal()

ggplotly(bar)


customers%>%
  full_join(orders)%>%
  group_by(customer_unique_id)%>%
  count(order_id)%>%
  summarise(orders = sum(n))

date16 <-
  datefull %>%
  full_join(orders) %>%
  full_join(orderItems)%>%
  full_join(orderPayments)%>%
  filter(year == 2017)%>%
  count(days, months)%>%
  arrange(desc(n))

rev<- orders%>%
  full_join(order_payments)

rev%>%
  filter(year == "2017")


dayiliOrders<- orders %>%
  group_by(data)%>%
  count(order_id)%>%
  summarise(orderDay = sum(n))%>%
  arrange(desc(orderDay))

joinProd<-order_reviews%>%
  inner_join(orders)%>%
  inner_join(order_items)%>%
  inner_join(products)

joinProd%>%
  group_by(product_id)%>%
  summarise(EVMean =mean(review_score))

unseller <-order_reviews%>%
  full_join(orders)%>%
  full_join(order_items)%>%
  full_join(sellers)

unseller%>%
  group_by(seller_id)%>%
  summarise(averageEV = mean(review_score))%>%
  arrange(desc(averageEV))
idsel<- "269c5fc9fcadee614364c3620c30a1f9"

snip<- sellers%>%
  filter(seller_id == idsel)




