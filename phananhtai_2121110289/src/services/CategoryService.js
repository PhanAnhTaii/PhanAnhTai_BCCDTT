import httpAxios from "../httpAxios";
function getAll() {
   return httpAxios.get('category/index');
}
function getById(id) {
    return httpAxios.get(`category/show/${id}`);
}
function create(category) {
    return httpAxios.post('category/store',category);
}
function update(category,id) {
    return httpAxios.post(`category/update/${id}`,category);
}
function remove(id) {
    return httpAxios.delete(`category/destroy/${id}`);
}
function getCatparentId(parent_id) {
    return httpAxios.get(`category_list/${parent_id}`);
}
function getBySlug(slug) {
    return httpAxios.get(`category/show/${slug}`);
}
function sortdelete(id) {
    return httpAxios.post(`category/sortdelete/${id}`);
}
function restore(id) {
    return httpAxios.post(`category/restore/${id}`);
}
function getTrash() {
    return httpAxios.get('category/trash');
 }
const categoryservice={
    getBySlug:getBySlug,
    getCatparentId:getCatparentId,
    gettAll:getAll,
    getById:getById,
    create:create,
    update:update,
    remove:remove, 
    getTrash:getTrash,
    restore:restore,
    sortdelete,sortdelete
}
export default categoryservice;



