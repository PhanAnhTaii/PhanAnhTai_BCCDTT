import httpAxios from "../httpAxios";
function getAll() {
   return httpAxios.get('topic/index');
}
function getById(id) {
    return httpAxios.get(`topic/show/${id}`);
}
function create(topic) {
    return httpAxios.post('topic/store',topic);
}
function update(topic,id) {
    return httpAxios.post(`topic/update/${id}`,topic);
}
function remove(id) {
    return httpAxios.delete(`topic/destroy/${id}`);
}
function getTopicId(parent_id) {
    return httpAxios.get(`topic_list/${parent_id}`);
}
function sortdelete(id) {
    return httpAxios.post(`topic/sortdelete/${id}`);
}
function restore(id) {
    return httpAxios.post(`topic/restore/${id}`);
}
function getTrash() {
    return httpAxios.get('topic/trash');
 }
const topicservice={
    getTopicId:getTopicId,
    gettAll:getAll,
    getById:getById,
    create:create,
    update:update,
    remove:remove, 
    getTrash:getTrash,
    restore:restore,
    sortdelete,sortdelete
}
export default topicservice;



