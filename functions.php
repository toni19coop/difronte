<?php
// functions.php del child theme del wp che gestisce e mostra i terminali installati e funzionanti

function terminali_column_headers( $columns ) {

 // creating custom column header data
 $columns = array(
 'cb'=>'<input type="checkbox" />',
 'title'=>__('Utente'),
 'ip_vpn'=>__('IP VPN'),
 'chiave_pubblica'=>__('Chiave pubblica'),
 'online'=>__('Status'),
 'link'=>__('Stanza'),
 );

 // returning new columns
 return $columns;
}
add_filter('manage_edit-terminali_columns','terminali_column_headers');


function terminali_column_data( $column, $post_id ) {
   // setup our return text
   $output = '';
   switch( $column ) {
      case 'utente':
         $fname = get_field('utente', $post_id );
         $output .= $fname;
         break;
      case 'ip_vpn':
         $ip = get_field('ip_vpn', $post_id );
         $output .= $ip;
         break;
      case 'chiave_pubblica':
         $chiave = get_field('chiave_pubblica', $post_id );
         $output .= $chiave;
        break;
      case 'online':
         $online = ping(get_field('ip_vpn',$post_id));
         $output .= ($online)?'<span style="color:green">online</span>':'<span style="color:red">offline</span>';
         break;
      case 'link':
         $nomecognome = '<a target="_blank" rel="noopener noreferrer" href="https://jitsi.19.coop/'.get_field('utente',$post_id).'">https://jitsi.19.coop/'.get_field('utente',$post_id).'</a>';
         $output .= $nomecognome;
         break;
   }

   // echo the output
   echo $output;

}
add_filter('manage_terminali_posts_custom_column','terminali_column_data',1,2);

function custom_admin_titles( $title, $post_id ) {
   global $post;
   $output = $title;
   if( isset($post->post_type) ):
      switch( $post->post_type ) {
         case 'terminali':
            $fname = get_field('utente', $post_id );
            $output = $fname;
            break;
      }
   endif;
   return $output;
}
add_filter('the_title', 'custom_admin_titles', 99, 2);

function ping($host)
{
  exec(sprintf('ping -c 1 -W 5 %s', escapeshellarg($host)), $res, $rval);
  return $rval === 0;
}
