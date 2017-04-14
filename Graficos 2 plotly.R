#clase plotly
library(plotly)

datag.2 <- read.csv2("C:\\Users\\Jaime\\Desktop\\Tesis\\Marzo\\Ventas no rack girada R 2.csv")
datag.prom <- read.csv2("C:\\Users\\Jaime\\Desktop\\Tesis\\Marzo\\BASE PROMOCIONES DTS R.csv")
datag.prom.3 <- read.csv2("C:\\Users\\Jaime\\Desktop\\Tesis\\Marzo\\BASE PROMOCIONES R 3.csv", header = FALSE)
feriados <- read.csv2("C:\\Users\\Jaime\\Desktop\\Tesis\\Marzo\\feriados 799 R.csv", header = FALSE)
partidos <- read.csv2( "C:\\Users\\Jaime\\Desktop\\Tesis\\Marzo\\Partidos.csv")
tiempo.c <- read.csv2("C:\\Users\\Jaime\\Desktop\\Tesis\\Marzo\\temp.int1.csv")
ventas.dts <- read.csv2("C:\\Users\\Jaime\\Desktop\\Tesis\\Marzo\\Ventas DTS Sem dia 11-04.csv")

p1 <- plot_ly(data = datag.2) %>%
  add_trace( x = ~ X , y = ~ X100410205 , type = "bar" ) %>%
  add_trace( x = ~ X ,  y = tiempo.c$t.Media, type = "scatter", mode = "markers", yaxis = "y2") %>%
  add_lines( x = ventas.dts$Dia ,  y = ventas.dts$Gross, line = list(shape = "hv"), yaxis = "y3" ) %>%
  add_trace( x = 463, y = 180000, name = "Tratamiento", type = "bar") %>%
  layout(
    title = "Venta dts",
    yaxis2 = list(
      tickfont = list(color = "red"),
      overlaying = "y",
      side = "right",
      title = "Temperatura"
    ),
    yaxis3 = list(
      tickfont = list(color = "blue"),
      overlaying = "y",
      side = "right",
      title = "Otra cosa",
      range = c(0,max(ventas.dts$Gross))
    )
  )

p2 <- plot_ly(data = datag.2) %>%
  add_trace( x = ~ X , y = ~ X100410205 , type = "bar" ) %>%
  add_lines( x = ventas.dts$Dia ,  y = ventas.dts$Gross, line = list(shape = "hv"), yaxis = "y2" ) %>%
  add_trace( x = 463, y = 180000, name = "Tratamiento", type = "bar") %>%
  layout(
    title = "Venta dts",
    yaxis2 = list(
      tickfont = list(color = "red"),
      overlaying = "y",
      side = "right",
      title = "Temperatura",
      range = c(0,max(ventas.dts$Gross))
    )
  )

p <- subplot(p1,p2, nrows = 2)

print(p)