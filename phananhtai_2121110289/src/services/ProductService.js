import httpAxios from "../httpAxios";
function getAll() {
   return httpAxios.get('product/index');
}
function getProductBySlug(slug) {
    return httpAxios.get(`product_detail/${slug}`);
 }
function getById(id) {
    return httpAxios.get(`product/show/${id}`);
}
function create(product) {
    return httpAxios.post('product/store',product);
}
function update(product,id) {
    return httpAxios.post(`product/update/${id}`,product);
}
function remove(id) {
    return httpAxios.delete(`product/destroy/${id}`);
}
function getProductHome(limit,category_id){
    return httpAxios.get(`product_home/${limit}/${category_id}`);
}
function getProductAll(limit,page=1){
    return httpAxios.get(`product_all/${limit}/${page}`);
}
function getProductByCategoryId(category_id,limit){
    return httpAxios.get(`product_category/${category_id}/${limit}`);
}
function getProductByBrandId(brand_id,limit){
    return httpAxios.get(`product_brand/${brand_id}/${limit}`);
}
function getProductSearch(key)
{
    return httpAxios.get(`product_search/${key}`);
}
function getProductSale(limit,page=1){
    return httpAxios.get(`product_sale/${limit}/${page}`);
}
function getProductBest(limit,page=1){
    return httpAxios.get(`product_best/${limit}/${page}`);
}
function getProductNew(limit,page=1){
    return httpAxios.get(`product_new/${limit}/${page}`);
}
function sortdelete(id) {
    return httpAxios.post(`product/sortdelete/${id}`);
}
function restore(id) {
    return httpAxios.post(`product/restore/${id}`);
}
function getTrash() {
    return httpAxios.get('product/trash');
 }
const productservice={
    getProductSearch:getProductSearch,
    getProductByBrandId:getProductByBrandId,
    getProductByCategoryId:getProductByCategoryId,
    getProductBySlug:getProductBySlug,
    getProductAll:getProductAll,
    getProductHome:getProductHome,
    getProductSale:getProductSale,
    getProductBest:getProductBest,
    getProductNew:getProductNew,
    gettAll:getAll,
    getById:getById,
    create:create,
    update:update,
    remove:remove, 
    getTrash:getTrash,
    restore:restore,
    sortdelete,sortdelete
}
export default productservice;



