import Home from '../pages/frontend/Home';
import Product from '../pages/frontend/Product';
import ProductDetail from '../pages/frontend/Product/ProductDetail';
import Contact from '../pages/frontend/Contact';
import Search from '../layouts/LayoutSite/Search';
import Post from '../pages/frontend/Post';
import PostDetail from '../pages/frontend/Post/PostDetail';
import Introduce from '../pages/frontend/Introduce';
import ShippingPolicy from '../pages/frontend/ShippingPolicy';
import WarrantyPolicy from '../pages/frontend/WarrantyPolicy';
import PurchasePolicy from '../pages/frontend/PurchasePolicy';
import ReturnPolicy from '../pages/frontend/ReturnPolicy';
import Cart from '../pages/frontend/Cart';
import ProductCategory from '../pages/frontend/ProductCategory';
import ProductBrand from '../pages/frontend/ProductBrand';
import PostTopic from '../pages/frontend/PostTopic';
import Login from '../pages/frontend/Login';
import Register from '../pages/frontend/Register';
import Information from '../pages/frontend/Information';
const RouterPublic=[
    {path:"/",component:Home},
    {path:"/san-pham",component:Product},
    {path:"/lien-he",component:Contact},
    {path:"/bai-viet",component:Post}, 
    {path:"/chi-tiet-san-pham/:slug",component:ProductDetail},
    {path:"/chi-tiet-bai-viet/:slug",component:PostDetail},
    {path:'/tim-kiem/:key',component:Search},
    {path:"/bai-viet",component:Post}, 
    {path:'/gioi-thieu',component:Introduce},
    {path:"/chinh-sach-van-chuyen",component:ShippingPolicy}   ,
    {path:"/chinh-sach-bao-hanh",component:WarrantyPolicy}   ,
    {path:"/chinh-sach-mua-hang",component:PurchasePolicy}   ,
    {path:"/chinh-sach-doi-tra",component:ReturnPolicy}  ,
    {path:"/gio-hang",component:Cart} ,
    {path:"/danh-muc-san-pham/:slug",component:ProductCategory},
    {path:"/chu-de-bai-viet/:slug",component:PostTopic},
    {path:"/thuong-hieu/:slug",component:ProductBrand},
    {path:"/dang-nhap",component:Login},
    {path:"/dang-ky",component:Register},
    {path:"/thong-tin",component:Information}
    
];
export default RouterPublic;    