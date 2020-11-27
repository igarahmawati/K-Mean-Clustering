#Impor data
library(readxl)
Data = read_excel("D:/Professional Files/Project/Data_Desa_2018.xlsx")
View(Data)

#Seleksi data numerik
data_numerik = Data[2:9]
data_numerik
#Standarisasi satuan data
data_standard = scale(data_numerik)
data_standard

#K-Mean clustering
library(factoextra)

#menentukan nilai K optiml
fviz_nbclust(data_standard, kmeans, method = "wss") #metode Elbow
fviz_nbclust(data_standard, kmeans, method = "silhouette") #metode Silhouette

#membuat cluster dengan k=3
clustering=kmeans(data_standard,centers = 3, iter.max = 10, nstart = 25)
clustering
fviz_cluster(clustering, geom="point",data=data_standard)+ggtitle("K=3")
table_final=data.frame(Data_Desa_2018, clustering$cluster)
View(table_final)