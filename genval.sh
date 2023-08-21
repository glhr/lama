for dataset in visual_test val eval
do
python3 bin/gen_mask_dataset.py \
$(pwd)/configs/data_gen/random_medium_256.yaml \
cat_dataset/${dataset}_source/ \
cat_dataset/${dataset}/random_medium_256.yaml \
--ext jpg
python3 bin/gen_mask_dataset.py \
$(pwd)/configs/data_gen/random_medium_256.yaml \
cat_dataset/${dataset}_source/ \
cat_dataset/${dataset}/random_medium_256.yaml \
--ext png
done
touch cat_dataset.yaml
echo "data_root_dir: $(pwd)/cat_dataset/" >> cat_dataset.yaml
echo "out_root_dir: $(pwd)/experiments/" >> cat_dataset.yaml
echo "tb_dir: $(pwd)/tb_logs/" >> cat_dataset.yaml
mv cat_dataset.yaml ${PWD}/configs/training/location/

