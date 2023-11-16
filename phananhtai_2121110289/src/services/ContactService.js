import httpAxios from "../httpAxios";
function getAll() {
   return httpAxios.get('contact/index');
}
function getById(id) {
    return httpAxios.get(`contact/show/${id}`);
}
function create(contact) {
    return httpAxios.post('contact/store',contact);
}
function update(contact,id) {
    return httpAxios.post(`contact/update/${id}`,contact);
}
function remove(id) {
    return httpAxios.delete(`contact/destroy/${id}`);
}
function sortdelete(id) {
    return httpAxios.post(`contact/sortdelete/${id}`);
}
function restore(id) {
    return httpAxios.post(`contact/restore/${id}`);
}
function getTrash() {
    return httpAxios.get('contact/trash');
 }
const contactservice={
    gettAll:getAll,
    getById:getById,
    create:create,
    update:update,
    remove:remove, 
    getTrash:getTrash,
    restore:restore,
    sortdelete,sortdelete
}
export default contactservice;



