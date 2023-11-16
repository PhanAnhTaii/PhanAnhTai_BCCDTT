import { useState } from 'react';
import { useEffect } from 'react';
import { FaPlus, FaRegEye, FaEdit, FaTrash ,FaArrowLeft,FaTrashRestore} from 'react-icons/fa';
import { Link } from "react-router-dom";
import topicservice from '../../../services/TopicService';
function TopicList() {
    const [statusdel,setStatusDel]=useState(0);
    const [topics, setTopics] = useState([]);
    useEffect(function () {
        (async function () {
            await topicservice.getTrash().then(function (result) {
                setTopics(result.data.data);
            });
        })();
    }, [statusdel])
    function topicDelete(id) {
        topicservice.remove(id).then(function (result) {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }
    function restore(id) {
        topicservice.restore(id).then(function (result) {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }
    return (
        
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger  ">THÙNG RÁC  </strong>
                    </div>
                    <div className="col-md-6 text-end">
                    <Link to="/admin/topic" className="btn btn-sm btn-outline-warning  me-2">
                            <FaArrowLeft />Quay Lại
                        </Link>

                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 50 }} className="text-center">#</th>
                            <th style={{ width: 200 }} className="text-center">Tên</th>
                            <th style={{ width: 200 }} className="text-center">Parent</th>
                            <th style={{ width: 130 }} className="text-center">Ngày Tạo</th>
                            <th style={{ width: 140 }} className="text-center">Chức Năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {topics.map(function(topic,index){
                            return <tr key={index }>
                            <td className="text-center">
                                <input type="checkbox" />
                            </td>
                            <td className="text-center">{topic.name}</td>
                            
                            <td className="text-center">{topic.parent_id}</td>
                            <td className="text-center">{topic.created_at}</td>
                            <td className="text-center">
                            <button onClick={() => restore(topic.id)}className="btn btn-sm btn-outline-success me-1">
                            <FaTrashRestore />
                                </button>
                                <button onClick={() => topicDelete(topic.id)} className="btn btn-sm btn-outline-danger me-1">
                                     <FaTrash/> 
                                </button>
                            </td>
                            <td className="text-center">{topic.id}</td>
                        </tr>
                        })}
                        
                    </tbody>
                </table>
            </div>
        </section>);
}
export default TopicList;