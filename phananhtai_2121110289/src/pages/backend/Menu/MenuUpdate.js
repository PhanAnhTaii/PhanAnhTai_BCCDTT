import { useEffect, useState } from "react";
import { Link, useParams,useNavigate } from "react-router-dom";
import menuservice from '../../../services/MenuService';

function MenuUpdate() {
    const navigate = useNavigate();
    
    const [name, setName] = useState('');
    const [link, setLink] = useState('');
    const [position, setPosition] = useState('');
    const [parent_id, setParentId] = useState(0);

    const [status, setStatus] = useState(1);
    ///////////////
    const { id } = useParams("id");
    ///////////////////
    useEffect(function () {
        (async function () {
            await menuservice.getById(id).then(function (result) {
                const tmp = result.data.data;
                setName(tmp.name);
                setLink(tmp.link);
                setPosition(tmp.position);
                setStatus(tmp.status);
            });
        })();
    }, []);
    ///////////lay danh sach
    const [menus, setMenus] = useState([]);
    useEffect(function () {
        (async function () {
            await menuservice.gettAll().then(function (result) {
                setMenus(result.data.data);
            });
        })();
    }, []);


    async function menuEdit(event) {
        event.preventDefault();
        var menu = new FormData();
        menu.append("name", name);
        menu.append("parent_id", parent_id);
        menu.append("link", link);
        menu.append("position", position);
        menu.append("status", status);
        await menuservice.update(menu,id)
            .then(function (res) {
                alert(res.data.message)
                navigate('/admin/menu', { replace: true })
            });
    }
    return (
    
        <form onSubmit={menuEdit} method="post">
             <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-danger">
                                CẬP NHẬT MENU
                            </strong>
                        </div>
                        <div className="col-md-6 text-end">
                            <button type="submit" className=" btn btn-sm btn-success me-2">
                                Lưu
                            </button>
                            <Link to="/admin/menu" className="btn btn-sm btn-info">Về Danh Sách</Link>
                        </div>
                    </div>
                </div>
                <div className="card-body">
                    <div className="row">
                        <div className="col-md-9">
                            <div className="mb-3">
                                <label htmlFor="name">Tên Menu</label>
                                <input type="text" name="name" value={name} onChange={(e) => setName(e.target.value)} className="form-control" />
                            </div>
                            <div className="mb-3">
                                <label htmlFor="name">Link</label>
                                <input type="text" name="name" value={link} onChange={(e) => setLink(e.target.value)} className="form-control"></input>
                            </div>
                            <div className="mb-3">
                                <label htmlFor="parent_id">Danh Mục Cha</label>
                                <select name="parent_id" value={parent_id} className="form-control" onChange={(e) => setParentId(e.target.value)}>
                                    <option value="0">Danh Mục Cha</option>
                                    {menus.map(function (menu, index) {
                                        return (
                                            <option key={index} value={menu.id}>{menu.name}</option>
                                        )
                                    })}
                                </select>
                            </div>
                            <div className="mb-3">
                                <label htmlFor="name">Vị Trí</label>
                                <input type="text" name="name" value={position} onChange={(e) => setPosition(e.target.value)} className="form-control"></input>
                            </div>
                        </div>
                    
                        
                            <div className="mb-3">
                                <label htmlFor="sort">Trạng Thái</label>
                                <select name="sort" value={status} className="form-control" onChange={(e) => setStatus(e.target.value)}>
                                    <option value="1">Xuất bản</option>
                                    <option value="2">Chưa xuất bản</option>

                                </select>
                            </div>
                        
                    </div>
                </div>
            </div>
        </form>
  );
}
export default MenuUpdate;