# Firebase Authentication

use_bpm 120


zen_hoops_dm = "E:/sound/splice/Samples/packs/Zeneth - Opulent/Melodic_Loops/Synth/ZEN_synth_loop_hoops_120_Dm.wav"

zen_base_vital_as = "E:/sound/splice/Samples/packs/Zeneth - Opulent/Melodic_Loops/Bass/ZEN_bass_loop_vital_120_A#.wav"


zen_drum_wave = "E:/sound/splice/Samples/packs/Zeneth - Opulent/Drum_Perc_Loops/Drum_Loops/ZEN_drum_loop_wave_110.wav"


# 1 ###############################################################
amp_zen_hoops_dm = 0.75
amp_zen_hoops_dm = 0
live_loop :zen_hoops_dm do
  sample zen_hoops_dm ,amp: amp_zen_hoops_dm
  sleep 16
end


amp_zen_base_vital_as = 1
#amp_zen_base_vital_as = 0
live_loop :zen_base_vital_as do
  sample zen_base_vital_as ,amp: amp_zen_base_vital_as
  sleep 16
end


# drum ###############################################################
amp_zen_drum_wave = 1
#amp_zen_drum_wave = 0
live_loop :zen_drum_wave do
  sample zen_drum_wave ,amp: amp_zen_drum_wave, beat_stretch: 16
  sleep 16
end
