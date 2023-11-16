import { FaEdit, FaTrash } from 'react-icons/fa';
import { Link, useNavigate, useParams } from "react-router-dom";
import menuservice from '../../../services/MenuService';
import { useEffect, useState } from 'react';
function MenuShow(){
    const { id } = useParams("id");
    const navigate = useNavigate();
    const [menu, setMenu] = useState([]);
    useEffect(function () {
        (async function () {
            await menuservice.getById(id).then(function (result) {
                setMenu(result.data.data);
            });
        })();
    }, []);
    function menuDelete(id){
        menuservice.remove(id).then(function (result) {
            alert(result.data.message);
            navigate('/admin/menu', { replace: true })
        });
    }
    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger  ">CHI TIẾT MENU</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/menu" className="btn btn-sm btn-outline-success me-1">
                            Về Danh Sách
                        </Link>
                        <Link to={"/admin/menu/update/" + menu.id} className="btn btn-sm btn-outline-primary me-1 ">
                            <FaEdit /> Sửa
                        </Link>
                        <button onClick={()=>menuDelete(menu.id)} className="btn btn-sm btn-outline-danger me-1">
                            <FaTrash /> Xóa
                        </button>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <td className="text-danger"style={{width:300}}><strong>Tên Trường</strong></td>
                            <td className="text-danger"><strong>Giá Trị</strong></td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                            <td>ID</td>
                            <td>{id}  </td>
                        </tr>
                        <tr>
                            <td>Tên Menu</td>
                            <td>{menu.name}  </td>
                        </tr>
                        <tr>
                            <td>Link</td>
                            <td>{menu.link}  </td>
                        </tr>
                        <tr>
                            <td>Vị Trí</td>
                            <td>{menu.position}  </td>
                        </tr>
                        <tr>
                            <td>Trạng Thái</td>
                            <td>{menu.status}  </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </section>

    );
}
export default MenuShow;