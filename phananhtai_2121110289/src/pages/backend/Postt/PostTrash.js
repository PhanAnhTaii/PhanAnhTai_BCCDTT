import { useState } from 'react';
import { useEffect } from 'react';
import { FaPlus, FaRegEye, FaEdit, FaTrash ,FaArrowLeft,FaTrashRestore} from 'react-icons/fa';
import { Link } from "react-router-dom";
import postservice from '../../../services/PostService';
import { urlImage } from '../../../config';
function PostList() {
    const [statusdel,setStatusDel]=useState(0);
    const [posts, setPosts] = useState([]);
    useEffect(function () {
        (async function () {
            await postservice.getTrash().then(function (result) {
                setPosts(result.data.data);
            });
        })();
    }, [statusdel])
    function postDelete(id) {
        postservice.remove(id).then(function (result) {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }
    function restore(id) {
        postservice.restore(id).then(function (result) {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }
    return (
        
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger  ">THÙNG RÁC</strong>
                    </div>
                    <div className="col-md-6 text-end">
                    <Link to="/admin/post" className="btn btn-sm btn-outline-warning  me-2">
                            <FaArrowLeft />Quay Lại
                        </Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table-bordered table-striped table-bordered table-hoverr">
                    <thead>
                        <tr>
                            <th style={{ width: 50 }} className="text-center">#</th>
                            <th style={{ width: 200 }} className="text-center">Tiêu Đề</th>
                            <th style={{ width: 200 }} className="text-center">Hình </th>
                            <th style={{ width: 200 }} className="text-center">Kiểu </th>
                            
                            <th style={{ width: 130 }} className="text-center">Ngày Tạo</th>
                            <th style={{ width: 140 }} className="text-center">Chức Năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {posts.map(function(post,index){
                            return <tr key={index }>
                            <td className="text-center">
                                <input type="checkbox" />
                            </td>
                            <td className="text-center">{post.title}</td>
                            <td className="text-center">
                                    <img style={{width:300}}className="img-fluid" src={urlImage +'postt/'+post.image} alt={post.title} />
                            </td>
                            <td className="text-center">{post.type}</td>
                            
                            <td className="text-center">{post.created_at}</td>
                            <td className="text-center">
                            <button onClick={() => restore(post.id)}className="btn btn-sm btn-outline-success me-1">
                            <FaTrashRestore />
                                </button>
                                <button onClick={() => postDelete(post.id)}className="btn btn-sm btn-outline-danger me-1">
                                     <FaTrash/> 
                                </button>
                            </td>
                            <td className="text-center">{post.id}</td>
                        </tr>
                        })}
                        
                    </tbody>
                </table>
            </div>
        </section>);
}
export default PostList;