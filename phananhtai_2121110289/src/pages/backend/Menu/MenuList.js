import { FaPlus, FaRegEye, FaEdit, FaTrash ,FaArrowLeft,FaTrashAlt} from 'react-icons/fa';
import { Link } from "react-router-dom";
import menuservice from '../../../services/MenuService';
import { useEffect } from 'react';
import { useState } from 'react';
function MenuList() {
    const [statusdel,setStatusDel]=useState(0);
    const [menus, setMenus] = useState([]);
    useEffect(function () {
        (async function () {
            await menuservice.gettAll().then(function (result) {
                setMenus(result.data.data);
            });
        })();
    }, [statusdel])
    function menuDelete(id) {
        menuservice.sortdelete(id).then(function (result) {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }
    return (
        
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger  ">DANH SÁCH MENU</strong>
                    </div>
                    <div className="col-md-6 text-end">
                    <Link to={"/admin/menu/trash"} className="btn btn-sm btn-outline-primary  me-2" >
                            <FaTrashAlt /> Thùng rác
                        </Link>
                    <Link to="/admin" className="btn btn-sm btn-outline-warning  me-2">
                            <FaArrowLeft />Về Trang Chủ
                        </Link>
                        <Link to="/admin/menu/create" className="btn btn-sm btn-outline-success">
                             <FaPlus/>Thêm 
                        </Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table-bordered table-hover table-striped">
                    <thead>
                        <tr>
                            <th style={{ width: 50 }} className="text-center">#</th>
                            <th style={{ width: 200 }} className="text-center">Tên</th>
                            <th style={{ width: 200 }}className="text-center">Link</th>
                            <th style={{ width: 200 }}className="text-center">Vị Trí</th>
                            
                            <th style={{ width: 130 }} className="text-center">Ngày Tạo</th>
                            <th style={{ width: 140 }} className="text-center">Chức Năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {menus.map(function(menu,index){
                            return <tr key={index }>
                            <td className="text-center">
                                <input type="checkbox" />
                            </td>
                            <td className="text-center">{menu.name}</td>
                            
                            <td className="text-center">{menu.link}</td>
                            <td className="text-center">{menu.position}</td>

                           
                            <td className="text-center">{menu.created_at}</td>
                            <td className="text-center">
                                <Link to={"/admin/menu/show/"+menu.id} className="btn btn-sm btn-outline-success me-1">
                                     <FaRegEye/> 
                                </Link>
                                <Link to={"/admin/menu/update/"+menu.id} className="btn btn-sm btn-outline-primary me-1 ">
                                    <FaEdit/> 
                                </Link>
                                <button onClick={() => menuDelete(menu.id)}className="btn btn-sm btn-outline-danger me-1">
                                     <FaTrash/> 
                                </button>
                            </td>
                            <td className="text-center">{menu.id}</td>
                        </tr>
                        })}
                        
                    </tbody>
                </table>
            </div>
        </section>);
}
export default MenuList;