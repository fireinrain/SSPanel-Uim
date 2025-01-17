{include file='user/main.tpl'}

<main class="content">
    <div class="content-header ui-content-header">
        <div class="container">
            <h1 class="content-heading">审计规则</h1>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-12 col-md-12">
            <section class="content-inner margin-top-no">
                <div class="card">
                    <div class="card-main">
                        <div class="card-inner">
                            <p>为了防止滥用与确保站点可以稳定运行，特制定了如下过滤规则，当您使用节点执行这些动作时，您的通信就会被截断。</p>
                        </div>
                    </div>
                </div>
                {if $config['enable_auto_detect_ban']===true}
                <div class="card">
                    <div class="card-main">
                        <div class="card-inner">
                        {if $config['auto_detect_ban_type']==1}
                            <p>请注意，每当您触发审计规则达 <strong>{$config['auto_detect_ban_number']}</strong> 次，将会被停止使用服务 <strong>{$config['auto_detect_ban_time']}</strong> 分钟</p>
                        {else}
                            <h4>请注意，审计将以以下规则执行：</h4>
                            <dl class="dl-horizontal">
                            {foreach $config['auto_detect_ban'] as $key => $value}
                                {if $value['type']=='kill'}
                                <dt><i class="mdi mdi-information-outline icon-sm"></i> 当您触碰审计规则达 <strong>{$key}</strong> 次，将会被直接 <strong>删除账号</strong></dt>
                                {else}
                                <dt><i class="mdi mdi-information-outline icon-sm"></i> 当您触碰审计规则达 <strong>{$key}</strong> 次，将会被封禁 <strong>{$value['time']}</strong> 分钟</dt>
                                {/if}
                            {/foreach}
                            </dl>
                        {/if}
                        </div>
                    </div>
                </div>
                {/if}
                <div class="card">
                    <div class="card-main">
                        <div class="card-inner">
                            <div class="card-table">
                                <div class="table-responsive table-user">
                                    {$render}
                                    <table class="table">
                                        <tr>
                                            <th>ID</th>
                                            <th>名称</th>
                                            <th>描述</th>
                                            <th>正则表达式</th>
                                            <th>类型</th>
                                        </tr>
                                        {foreach $rules as $rule}
                                            <tr>
                                                <td>#{$rule->id}</td>
                                                <td>{$rule->name}</td>
                                                <td>{$rule->text}</td>
                                                <td>{$rule->regex}</td>
                                                {if $rule->type == 1}
                                                    <td>数据包明文匹配</td>
                                                {/if}
                                                {if $rule->type == 2}
                                                    <td>数据包 hex 匹配</td>
                                                {/if}
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
    </div>
</main>

{include file='user/footer.tpl'}
