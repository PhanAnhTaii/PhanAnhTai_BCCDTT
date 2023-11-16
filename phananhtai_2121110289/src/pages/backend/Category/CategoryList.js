import { FaPlus, FaRegEye, FaEdit, FaTrash,FaArrowLeft,FaTrashAlt } from 'react-icons/fa';
import { Link } from "react-router-dom";
import { useState } from 'react';
import { useEffect } from 'react';
import categoryservice from '../../../services/CategoryService';
import { urlImage } from '../../../config';
function CategoryList() {
    const [statusdel,setStatusDel]=useState(0);
    const [categorys, setCategorys] = useState([]);
    useEffect(function () {
        (async function () {
            await categoryservice.gettAll().then(function (result) {
                setCategorys(result.data.data);
            });
        })();
    }, [statusdel])
    function categoryDelete(id) {
        categoryservice.sortdelete(id).then(function (result) {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }
    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">DANH SÁCH DANH MỤC</strong>
                    </div>
                    <div className="col-md-6 text-end">
                    <Link to={"/admin/category/trash"} className="btn btn-sm btn-outline-primary  me-2" >
                            <FaTrashAlt /> Thùng rác
                        </Link>
                    <Link to="/admin" className="btn btn-sm btn-outline-warning  me-2">
                            <FaArrowLeft />Về Trang Chủ
                        </Link>
                        <Link to="/admin/category/create" className="btn btn-sm btn-outline-success">
                            <FaPlus />Thêm
                        </Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table-bo table-striped table-bordered table-hover" >
                    <thead>
                        <tr>
                            <th style={{ width: 50 }} className="text-center">#</th>
                    
                            <th style={{ width: 200 }}className="text-center">Tên Danh Mục</th>
                            <th style={{ width: 200 }}className="text-center">Hình</th>
                         
                            <th style={{ width: 130 }} className="text-center">Parent</th>
                            <th style={{ width: 130 }} className="text-center">Ngày Tạo</th>
                            <th style={{ width: 140 }} className="text-center">Chức Năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {categorys.map(function (category, index) {
                            return <tr key={index}>
                                <td className="text-center">
                                    <input type="checkbox" />
                                </td>
                                
                                <td className="text-center">{category.name}</td>
                                <td className="text-center">
                                    <img style={{ width: 200, height: 150 }} className="img-fluid" src={urlImage + 'category/' + category.image} alt={category.name} />
                                </td>

                                <td className="text-center">{category.parent_id}</td>
                                <td className="text-center">{category.created_at}</td>
                                <td className="text-center">
                                    <Link to={"/admin/category/show/"+category.id} className="btn btn-sm btn-outline-success me-1">
                                        <FaRegEye />
                                    </Link>
                                    <Link to={"/admin/category/update/"+category.id} className="btn btn-sm btn-outline-primary me-1 ">
                                        <FaEdit />
                                    </Link>
                                    <button onClick={() => categoryDelete(category.id)}className="btn btn-sm btn-outline-danger me-1">
                                        <FaTrash />
                                    </button>

                                </td>
                                <td className="text-center">{category.id}</td>
                            </tr>
                        })} 

                    </tbody>
                </table>
            </div>
        </section>);
}
export default CategoryList;