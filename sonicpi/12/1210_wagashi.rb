use_bpm 140
# pop

ee_140_arp_dovegrey_c = "E:/sound/splice/Samples/packs/Electronic Explorations/Electronic_Explorations/Melodic_Loops/Arp/EE_140_arp_dovegrey_Cmaj.wav"

mo_ha_140_caustics_c = "E:/sound/splice/Samples/packs/Ocean of Dreams MEGAMIX, a hallow moment/Moment_hallow_Ocean_of_Dreams_MEGAMIX/loops/tonal_loops/songstarters/MO_HA_140_synth_loop_caustics_Cmaj.wav"

mo_shinju_138_dm = "E:/sound/splice/Samples/packs/utopia tone 2, a shinju moment/Moment_shinju_utopia_tone_2/loops/songstarters/MO_SHINJU_138_songstarter_cenotaph_Dmin.wav"
mo_shinju_138_dm_bpm140 = "E:/sound/splice/Samples/packs/utopia tone 2, a shinju moment/Moment_shinju_utopia_tone_2/loops/songstarters/MO_SHINJU_138_songstarter_cenotaph_Dmin_bpm140.wav"


mo_shinju_innsmouth_fm = "E:/sound/splice/Samples/packs/utopia tone 2, a shinju moment/Moment_shinju_utopia_tone_2/loops/songstarters/MO_SHINJU_140_songstarter_innsmouth_Fmin.wav"
mo_fs_bass_loop_fm = "E:/sound/splice/Samples/packs/Golden Axe, a fortuneswan moment/Moment_-_Golden_Axe__a_fortuneswan_moment/loops/gen_loops/MO_FS_140_guitar_loop_airy/MO_FS_140_bass_guitar_loop_airy_Fmin.wav"



ds_dubstep = "E:/sound/splice/Samples/packs/Skybreak -  Colorful Dubstep Vol 1/Disciple_Samples_-_Skybreak_Colorful_Dubstep_Vol._1/loops/drum_loops/full_loops/DS_SCD_142_drum_full_loop_uk_dubstep.wav"

kmrbi_imk2_loop = "E:/sound/splice/Samples/packs/Internet Music Kit Vol. 2/Komorebi_Audio_-_Internet_Music_Kit_Vol._2_-_Sample_Pack/Loops/Drum_Loops/Full_Drum_Loops/KMRBI_IMK2_140_drum_loop_tough.wav"


#  ###############################################################

amp_ee_140_arp_dovegrey_c = 1
#amp_ee_140_arp_dovegrey_c = 0
live_loop :ee_140_arp_dovegrey do
  sample ee_140_arp_dovegrey_c ,amp: amp_ee_140_arp_dovegrey_c
  sleep 32
end


#  ###############################################################
amp_mo_ha_140_caustics_c = 1
amp_mo_ha_140_caustics_c = 0
live_loop :mo_ha_140_caustics_c do
  sample mo_ha_140_caustics_c ,amp: amp_mo_ha_140_caustics_c
  sleep 32
end


#  ###############################################################
amp_mo_shinju_138_dm_bpm140 = 1
amp_mo_shinju_138_dm_bpm140 = 0
live_loop :mo_shinju_138_dm_bpm140 do
  sample mo_shinju_138_dm_bpm140 ,amp: amp_mo_shinju_138_dm_bpm140
  sleep 32
end


#  ###############################################################
amp_mo_shinju_innsmouth_fm = 1
amp_mo_shinju_innsmouth_fm = 0
live_loop :mo_shinju_innsmouth_fm do
  sample mo_shinju_innsmouth_fm ,amp: amp_mo_shinju_innsmouth_fm
  sleep 32
end

amp_mo_fs_bass_loop_fm = 1
amp_mo_fs_bass_loop_fm = 0
live_loop :mo_fs_bass_loop_fm do
  sample mo_fs_bass_loop_fm ,amp: amp_mo_fs_bass_loop_fm
  sleep 32
end

#  ###############################################################
amp_ds_dubstep = 1
#amp_ds_dubstep = 0
live_loop :ds_dubstep do
  sample ds_dubstep ,amp: amp_ds_dubstep, beat_stretch:16
  sleep 16
end

amp_kmrbi_imk2_loop = 1
amp_kmrbi_imk2_loop = 0
live_loop :kmrbi_imk2_loop do
  sample kmrbi_imk2_loop ,amp: amp_kmrbi_imk2_loop, beat_stretch:16
  sleep 16
end
