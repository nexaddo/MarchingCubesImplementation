#!/usr/bin/perl

use strict;
use warnings;
use SDL::App;
use SDL::OpenGL;


my ($done, $frame);
my ($conf, $sdl_app);

START: main();

sub main
{
    init();
    main_loop();
    cleanup();
}

sub init
{
    $| = 1;
    init_conf();
    init_window();
}

sub init_conf
{
    $conf = {
        title  => 'Voxel Demo',
        width  => 600,
        height => 800,
    };
}

sub init_window
{
    my ($title, $w, $h)= @$conf{qw(title width height)};
    
    $sdl_app = SDL::App->new(-title  => $title,
                             -width  => $w,
                             -height => $h,
                             -gl     => 1,
                            );
    SDL::ShowCursor(0);
}

sub main_loop
{
    while (not $done) {
        $frame++;
        do_frame();
    }
}

sub do_frame
{
    print '.';
    sleep 1;
    $done = 1 if $frame == 5;
}

sub cleanup
{
    print "\nDone.\n";
}