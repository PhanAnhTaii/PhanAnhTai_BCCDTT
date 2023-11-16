import productservice from '../../../services/ProductService';

import ProductItem from "../../../components/frontend/ProductItem";
import { useState } from "react";
import { useEffect } from "react";

function ProductBest(){
    const [limit,setLimit]=useState(4);
    const [products, setProducts] = useState([]);
    useEffect(function () {
        (async function () {
            await productservice.getProductBest(limit,1).then(function (result) {
                setProducts(result.data.best_products);
            });
        })();
    }, [limit])
    return (
        <section className="maincontent my-4">
            <div className="container">
                    <h3 className="text-center text-danger my-4">SẢN PHẨM BÁN CHẠY</h3>
                    <div className="row">
                    {products.map(function (product, index) {
                            return <ProductItem product={product} key={index} />
                        })}
                </div>
                <div className='row'>
                    <div className='col-12 text-center'>
                        <button className="btn btn-success" onClick={()=>setLimit(limit+4)}>Xem thêm</button>
                        </div>
                </div >
                
            </div>
        </section>
    );
}
export default ProductBest;