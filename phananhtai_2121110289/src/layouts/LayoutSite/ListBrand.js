import { Link } from "react-router-dom";
import brandservice from '../../services/BrandService';
import { useState } from "react";
import { useEffect } from "react";
function ListBrand() {
    const [listBrand,setListBrand]=useState([]);
    useEffect(function(){
        (async function(){
            try{
            const result = await brandservice.gettAll();
            setListBrand(result.data.data);
            }catch(error){
                console.error(error);
            }
        })();
    },[])
    return (
        <div className="listbrand mb-5">
            <h3 className=" p-3 m-0 text-center fs-5"style={{backgroundColor:"#031b36",color:"white",width:397}}>THƯƠNG HIỆU SẢN PHẨM</h3>
            <ul>
                {listBrand.map(function(brand,index){
                    return (

                <li style={{listStyle:"none"}}key={index} className="my-4">
                    <Link className='m-3'style={{textDecorationLine:"none"}}to={'/thuong-hieu/'+brand.slug}>{brand.name}</Link>
                </li>);
            })}
            </ul>
        </div>
    );
}

export default ListBrand;
