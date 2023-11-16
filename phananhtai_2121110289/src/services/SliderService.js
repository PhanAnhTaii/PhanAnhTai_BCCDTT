import httpAxios from "../httpAxios";
function getAll() {
   return httpAxios.get('slider/index');
}
function getById(id) {
    return httpAxios.get(`slider/show/${id}`);
}
function create(slider) {
    return httpAxios.post('slider/store',slider);
}
function update(slider,id) {
    return httpAxios.post(`slider/update/${id}`,slider);
}
function remove(id) {
    return httpAxios.delete(`slider/destroy/${id}`);
}
function getByPosition(position) {
    return httpAxios.get(`slider_list/${position}`);
}
function sortdelete(id) {
    return httpAxios.post(`slider/sortdelete/${id}`);
}
function restore(id) {
    return httpAxios.post(`slider/restore/${id}`);
}
function getTrash() {
    return httpAxios.get('slider/trash');
 }
const sliderservice={
    getByPosition:getByPosition,
    gettAll:getAll,
    getById:getById,
    create:create,
    update:update,
    remove:remove, 
    getTrash:getTrash,
    restore:restore,
    sortdelete,sortdelete
}
export default sliderservice;



