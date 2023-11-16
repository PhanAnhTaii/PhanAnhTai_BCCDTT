import { useState } from "react";
import ListPost from "../../../layouts/LayoutSite/ListPost";
import { useEffect } from "react";
import PostItem from "../../../components/frontend/PostItem";
import topicservice from "../../../services/TopicService";
import { useParams } from "react-router-dom";
import postservice from "../../../services/PostService";

function PostTopic() {
    const { slug } = useParams();
    const [limit, setLimit] = useState(4);
    const [posts, setPosts] = useState([]);
    const [title, setTitle] = useState("")

    useEffect(function(){
        (async function(){
            try{
                const infotopic=await topicservice.getById(slug);
                setTitle(infotopic.data.data.name);
                const topicid=infotopic.data.data.id;
                const infopost= await postservice.getPostTopicId(topicid,limit);
                setPosts(infopost.data.posts);

            }catch(error){
                console.error(error);
            }
        })();
    },[limit,slug])
    return (  
        <section className="maincontent">
        <div className="container-my-4"> 
            <div className="row">
            <div className="col-md-3 p-0 my-5 ">
                <ListPost/>
            </div>
            <div className="col-md-9">
                <h3 className="text-center text-danger my-4">{title}</h3>
                <div className="row">
                    {posts.map(function (post, index) {
                        return <PostItem post={post} key={index} />
                    })}
                </div>

                <div className='row'>
                    <div className='col-12 text-center my-2'>
                        <button className="btn btn-success" onClick={() => setLimit(limit + 4)}>Xem thêm</button>
                    </div>
                </div>
                </div>
            </div>
        </div >
    </section>
        );
}

export default PostTopic;