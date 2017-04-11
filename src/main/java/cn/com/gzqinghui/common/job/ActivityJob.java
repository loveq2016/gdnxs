package cn.com.gzqinghui.common.job;

import cn.com.gzqinghui.messagemgr.msginfo.vo.MsginfoVO;
import cn.com.gzqinghui.sysmgr.common.util.DateUtil;
import com.dexcoder.dal.JdbcDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Component("activityJob")
public class ActivityJob {
    private static final Logger log = LoggerFactory.getLogger(ActivityJob.class);

    @Autowired
    protected JdbcDao jdbcDao;

    /**
     * 修改活动状态
     */
    @Scheduled(cron = "*/10 * * * * ?")
    public void jobUpdateActivitStatus(){
        try {
            log.info("执行修改状态任务");
            List<Map<String,Object>> list =  jdbcDao.queryListForSql(" select * from tb_activity_info  where END_TIME < NOW() and ASTATUS = 0 ");
            for(Map rec : list){
                StringBuilder sql =  new StringBuilder(" select b.*,a.ACT_ID,a.VOTENUM,a.`NO`  from tb_act_member_ref a \n" +
                        "INNER JOIN tb_member_info b on a.MEMBER_ID = b.ID where a.ACT_ID = '"+rec.get("id")+"' ORDER BY a.VOTENUM desc ");
                List<Map<String,Object>> memberlist = jdbcDao.queryListForSql(sql.toString());
                for(int i=0;i<memberlist.size();i++){
                    MsginfoVO msginfoVO = new MsginfoVO();
                    msginfoVO.setId(UUID.randomUUID().toString());
                    msginfoVO.setMemberId((String) memberlist.get(0).get("id"));
                    msginfoVO.setCreatedate(DateUtil.formartCurrentDate());
                    msginfoVO.setTitle("活动结束投票结果信息");
                    msginfoVO.setMsgdesc("您参加的活动" + rec.get("title") + "投票已经结束，恭喜您获得了第" + (i + 1) + "名。");
                    jdbcDao.save(msginfoVO);
                }
                jdbcDao.updateForSql("update tb_activity_info set ASTATUS = 1 where id = '"+rec.get("id")+"'");
            }

            log.info("执行修改活动状态任务成功");
        }catch (Exception e){
            log.error(e.getMessage(),e);
        }

    }

    /**
     * 剔除超过28岁的团干
     */
    @Scheduled(cron = "0 0 23 * * ?")
    public void jobUpdateMemberOld(){
        try {
            log.info("执行剔除超过28岁团干任务");
            jdbcDao.updateForSql(" DELETE FROM tb_member_info  where  (year(now())-year(birthday)-1) + ( DATE_FORMAT(birthday, '%m%d') <= DATE_FORMAT(NOW(), '%m%d') ) >28  and mtype = 0  ");
            log.info("执行剔除超过28岁团干任务成功");
        }catch (Exception e){
            log.error(e.getMessage(),e);
        }

    }
}
