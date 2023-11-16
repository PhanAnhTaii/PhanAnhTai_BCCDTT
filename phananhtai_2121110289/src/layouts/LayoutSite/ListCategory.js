import { useState } from "react";
import { useEffect } from "react";
import { Link } from "react-router-dom";
import categoryservice from "../../services/CategoryService";
function ListCategory() {
    const [listCategory,setListCategory]=useState([]);
    useEffect(function(){
        (async function(){
            try{
            const result = await categoryservice.getCatparentId(0);
            setListCategory(result.data.categorys);
            }catch(error){
                console.error(error);
            }
        })();
    },[])
    return (  
        <div className="listcategory mb-5">
            <h3 className=" p-3 m-0 text-center fs-5"style={{backgroundColor:"#031b36",color:"white",width:397}}>DANH MỤC SẢN PHẨM</h3>
            <ul>
                {listCategory.map(function(cat,index){
                    return (

                <li style={{listStyle:"none"}}key={index} className="my-4 ">
                    <Link className='m-3'style={{textDecorationLine:"none"}}to={'/danh-muc-san-pham/'+cat.slug}>{cat.name}</Link>
                </li>);
            })}
            </ul>
        </div>
    );
}

export default ListCategory;
