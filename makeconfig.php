<?php

    function make_blank($n)
    {
        $str = '';
        for ($i=0;$i<$n*4;++$i)
            $str .= ' ';
        return $str;
    }

    function print_loop($arr, $deep = 1)
    {
        if (is_array($arr))
        {
            $ret = 'array(';
            foreach($arr as $k => $v)
                if (is_array($v))
                    $ret .= PHP_EOL.make_blank($deep).'\''.$k.'\' => '.print_loop($v, $deep + 1).',';
                else
                    $ret .= PHP_EOL.make_blank($deep).'\''.$k.'\' => \''.print_loop($v, $deep + 1).'\',';
            $ret = rtrim($ret, ',');
            return $ret.PHP_EOL.make_blank($deep - 1).')';
        }
        return addslashes($arr);
    }

    require_once('/var/www/html/alxwvj/Config.Daemon.php');

    $conf['OJ_LIST'][] = 'AJC';

    $conf['OJ_PREFIX_LIST']['AJC'] = '';


    $code = '<?php'.PHP_EOL.PHP_EOL;

    $code .= make_blank(1).'$conf = '.print_loop($conf, 2);

    $code .=';'.PHP_EOL.PHP_EOL;

    $code .= '?>'.PHP_EOL;

    file_put_contents('/var/www/html/alxwvj/Config.Daemon.php', $code);

    echo 'Make change of AJC'.PHP_EOL;

?>
