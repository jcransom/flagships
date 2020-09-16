library("ggplot2")
theme_set(theme_bw())
library("sf")
library("ggrepel")
library("rnaturalearth")
library("rnaturalearthdata")

world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)

ggplot(data = world) +
  geom_sf() +
  ggtitle("African Flagship Universities", subtitle = paste0("(", length(unique(world$NAME)), " countries)"))

ggplot(data = world) +
  geom_sf(fill= "antiquewhite") +
  coord_sf(xlim = c(-23, 55), ylim = c(-38, 42), expand = FALSE)+
  ggtitle("African Flagship Universities", subtitle = paste0("The University of Rwanda and eight secondary cases"))

afcities <- data.frame(flag = rep("flagship", 10), 
                       city = c("Addis Ababa University (Ethiopia)", "University of Ghana (Accra)", "University of Cape Town \n(South Africa)", "University of Zimbabwe (Harare)", "University of Ibadan (Nigeria)", "University of Rwanda (Kigali)", "University of Zambia (Lusaka)", "University of Mauritius (Moka)", "Makerere University \n(Kampala, Uganda)", "University of Namibia (Windhoek)"),
                       lat = c(8.990575, 5.546442, -33.927367, -17.781026, 7.391513, -1.946080, -15.408470, -20.163832, 0.318812, -22.566436),
                       lng = c(38.756285, -0.191749, 18.422959, 31.062281, 3.897130, 30.058705, 28.290226, 57.502211, 32.585915, 17.074325))

(afcities <- st_as_sf(afcities, coords = c("lng", "lat"), remove = FALSE, 
                      crs = 4326, agr = "constant"))

ggplot(data = world) +
  geom_sf(fill= "antiquewhite") +
  geom_sf(data = afcities) +
  geom_point(data = afcities, aes(x = lng, y = lat), size = 3, 
             shape = 23, fill = "darkred") +
  geom_label_repel(data = afcities, aes(x = lng, y = lat, label = city), 
                   size = 2, fontface = "bold") +
  coord_sf(xlim = c(-23, 65), ylim = c(-42, 42), expand = FALSE) +
  ggtitle("African Flagship Universities", subtitle = paste0("The University of Rwanda and nine secondary cases")) +
  theme(panel.grid.major = element_line(color = gray(.7), linetype = "dashed", size = 0.2), panel.background = element_rect(fill = "aliceblue"), axis.title.x=element_blank(), axis.title.y=element_blank(), axis.text.x=element_blank(), axis.text.y=element_blank(), axis.ticks.x=element_blank(), axis.ticks.y=element_blank())

ggsave("flagship_map.png", dpi = "print")

## to do: repel out a bit further?