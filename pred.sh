checkpoint=epoch\=5-step\=6409.ckpt

cp $(pwd)/experiments/gala_2023-08-17_08-54-05_train_lama-fourier-cats_/models/${checkpoint} $(pwd)/experiments/gala_2023-08-17_08-54-05_train_lama-fourier-cats_/best.ckpt

for split in final_test_500 test_200 validation_100
do

CUDA_VISIBLE_DEVICES=0 python3 bin/predict.py \
model.path=$(pwd)/experiments/gala_2023-08-17_08-54-05_train_lama-fourier-cats_/ \
indir=$(pwd)/cat_dataset/${split} \
outdir=$(pwd)/cat_dataset/${split}_predictions/ \
model.checkpoint=best.ckpt

rm -rf ../results/inpainted_${split}_CelebrityCats
cp -r $(pwd)/cat_dataset/${split}_predictions ../results/inpainted_${split}_CelebrityCats
done
