{include file='user/main.tpl'}

<main class="content">
    <div class="content-header ui-content-header">
        <div class="container">
            <h1 class="content-heading">邀请链接</h1>
        </div>
    </div>
    <div class="container">
        <section class="content-inner margin-top-no">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="card margin-bottom-no">
                        <div class="card-main">
                            <div class="card-inner">
                                <div class="card-inner">
                                    <p class="card-heading">邀请有奖</p>
                                    <ul>
                                        <li>每邀请一位用户注册，您都会获得 <code>{$config['invite_gift']}G</code> 流量奖励；对方会获得 <code>{$config['invite_get_money']}</code> 元余额奖励</li>
                                        <li>对方在进行账户充值或购买套餐后，您可获得订单金额的 <code>{$config['code_payback'] * 100} %</code> 作为返利</li>
                                        <li>具体邀请返利规则请查看公告，或通过工单系统询问管理员</li>
                                    </ul>
                                    <p>您通过邀请好友获得的总返利为：<code>{$paybacks_sum}</code> 元</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                {if $user->class>=0}
                    {if $user->invite_num!=-1}
                        <div class="col-lg-6 col-md-6">
                            <div class="card margin-bottom-no">
                                <div class="card-main">
                                    <div class="card-inner margin-bottom-no">
                                        <div class="card-inner margin-bottom-no">
                                            <div class="cardbtn-edit">
                                                <div class="card-heading">邀请链接</div>
                                                    <div class="reset-flex">
                                                    <span>重置链接</span>
                                                    <a onclick="replaceInviteUrl()" class="reset-link btn btn-brand-accent btn-flat">
                                                        <i class="mdi mdi-autorenew"></i>&nbsp;
                                                    </a>
                                                </div>
                                            </div>
                                            <p>剩余可邀请次数：{if $user->invite_num<0}无限{else}
                                                <code>{$user->invite_num}</code>{/if}</p>
                                            <p>发送邀请链接给有需要的人，邀请他人注册时，请将以下链接发给被邀请者</p>
                                            <div class="invite-link">
                                                <input type="text"
                                                       class="input form-control form-control-monospace cust-link"
                                                       name="input1" readonly=""
                                                       value="{$config['baseUrl']}/auth/register?code={$code->code}">
                                                <button class="copy-text btn btn-subscription" type="button"
                                                        data-clipboard-text="{$config['baseUrl']}/auth/register?code={$code->code}">
                                                    点击复制
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {if $config['custom_invite_price']>=0}
                            <div class="col-lg-6 col-md-6">
                                <div class="card margin-bottom-no">
                                    <div class="card-main">
                                        <div class="card-inner margin-bottom-no">
                                            <div class="card-inner margin-bottom-no">
                                                <div class="cardbtn-edit">
                                                    <div class="card-heading">定制链接后缀 <code
                                                                class="card-tag tag-green">{$config['custom_invite_price']}
                                                            RMB/次</code></div>
                                                    <button class="btn btn-flat" id="custom-invite-confirm"><span
                                                                class="mdi mdi-check"></span>&nbsp;
                                                    </button>
                                                </div>
                                                <p>例:输入<code>vip</code>则链接变为<code>{$config['baseUrl']}
                                                        /auth/register?code=vip</code></p>
                                                <div class="form-group form-group-label">
                                                    <label class="floating-label"
                                                           for="custom-invite-link">输入链接后缀</label>
                                                    <input class="form-control maxwidth-edit" id="custom-invite-link"
                                                           type="num">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/if}
                    {/if}
                    {if $config['invite_price']>=0}
                        <div class="col-lg-6 col-md-6">
                            <div class="card margin-bottom-no">
                                <div class="card-main">
                                    <div class="card-inner">
                                        <div class="card-inner">
                                            <div class="cardbtn-edit">
                                                <div class="card-heading">购买邀请次数 <code
                                                            class="card-tag tag-green">{$config['invite_price']}
                                                        RMB/个</code></div>
                                                <button class="btn btn-flat" id="buy-invite"><span
                                                            class="mdi mdi-cart-plus"></span></button>
                                            </div>
                                            <p>在下方输入需要购买的邀请次数</p>
                                            <div class="form-group form-group-label">
                                                <label class="floating-label" for="buy-invite-num">输入购买次数</label>
                                                <input class="form-control maxwidth-edit" id="buy-invite-num"
                                                       type="num">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/if}
                {else}
                    <div class="col-xx-12">
                        <div class="card margin-bottom-no">
                            <div class="card-main">
                                <div class="card-inner">
                                    <p class="card-heading">邀请链接</p>
                                    <h3>{$user->user_name}，您不是VIP暂时无法使用邀请链接，<a href="/user/shop">成为VIP请点击这里</a></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
                <div class="col-xx-12">
                    <div class="card">
                        <div class="card-main">
                            <div class="card-inner">
                                <div class="card-table">
                                    <div class="table-responsive bgc-fix table-user">
                                        {$render}
                                        <table class="table">
                                            <tr>
                                                <th>ID</th>
                                                <th>邀请用户昵称</th>
                                                <th>返利金额</th>
                                                <th>返利时间</th>
                                            </tr>
                                            {foreach $paybacks as $payback}
                                                <tr>
                                                    <td>{$payback->id}</td>
                                                    {if $payback->user()!=null}
                                                        <td>{$payback->user()->user_name}</td>
                                                    {else}
                                                        <td>已注销</td>
                                                    {/if}
                                                    <td>{$payback->ref_get} 元</td>
                                                    <td>{date('Y-m-d H:i:s', $payback->datetime)}</td>
                                                </tr>
                                            {/foreach}
                                        </table>
                                        {$render}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                {include file='dialog.tpl'}
            </div>
        </section>
    </div>
</main>

{include file='user/footer.tpl'}

<script>
    $(function () {
        new ClipboardJS('.copy-text');
    });
    $(".copy-text").click(function () {
        $("#result").modal();
        $$.getElementById('msg').innerHTML = '已复制到您的剪贴板，请您继续接下来的操作。';
    });
    $(document).ready(function () {
        $("#invite").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/invite",
                dataType: "json",
                success: (data) => {
                    window.location.reload();
                },
                error: (jqXHR) => {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = `发生错误：${
                            jqXHR.status
                            }`;
                }
            })
        })
    })
</script>
<script>
    $(".payback-datetime").each(function() {
        var $this = $(this);
        $this.text(() => {
            var unix_timestamp = parseFloat($this.text());
            var date = new Date(unix_timestamp*1000).toLocaleDateString("zh-CN");
            var time = new Date(unix_timestamp).toLocaleTimeString("zh-CN");
            var formattedTime = date + ' ' + time;
            return formattedTime;
        });
    });
</script>
<script>
    $("#buy-invite").click(function () {
        $.ajax({
            type: "POST",
            url: "/user/buy_invite",
            dataType: "json",
            data: {
                num: $$getValue('buy-invite-num')
            },
            success: (data) => {
                if (data.ret) {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = data.msg;
                    window.setTimeout("location.href='/user/invite'", {$config['jump_delay']});
                } else {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = data.msg;
                }
            },
            error: (jqXHR) => {
                $("#result").modal();
                $$.getElementById('msg').innerHTML = `${
                        data.msg
                        } 出现了一些错误`;
            }
        })
    });
    $("#custom-invite-confirm").click(function () {
        $.ajax({
            type: "POST",
            url: "/user/custom_invite",
            dataType: "json",
            data: {
                customcode: $$getValue('custom-invite-link'),
            },
            success: (data) => {
                if (data.ret) {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = data.msg;
                    window.setTimeout("location.href='/user/invite'", {$config['jump_delay']});
                } else {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = data.msg;
                }
            },
            error: (jqXHR) => {
                $("#result").modal();
                $$.getElementById('msg').innerHTML = `${
                        data.msg
                        } 出现了一些错误`;
            }
        })
    });
</script>

<script>
    function replaceInviteUrl() {
        $.ajax({
            url: '/user/invite',
            type: 'PUT',
            dataType: "json",
            success: function (data) {
                if (data.ret) {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = data.msg;
                    window.setTimeout("location.href='/user/invite'", {$config['jump_delay']});
                } else {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = data.msg;
                }
            }
        });
    }
</script>