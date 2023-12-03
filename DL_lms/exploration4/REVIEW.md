## AIFFEL Campus Online Code Peer Review Templete
- 코더 : 박해극
- 리뷰어 : 강임구


## PRT(Peer Review Template)
- [v]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 
    퀘스트 문제 요구조건 등을 지칭
        - 해당 조건을 만족하는 코드를 캡쳐해 근거로 첨부

1. GAN의 두 모델 구조를 통해 이미지를 성공적으로 생성하였다.
```
확인불가

생성된 이미지가 있지만 생성된 이미지를 변환하는 코드가 없어
육안으로는 확인이 안됨.
이미지를 변환하는 코드를 작성해봤지만 오류가 나서 그대로 진행하였다고 답변하심

def generate_and_save_images(model, epoch, it, sample_seeds):

    predictions = model(sample_seeds, training=False)
    
    fig = plt.figure(figsize=(4, 4))
    for i in range(predictions.shape[0]):
        plt.subplot(4, 4, i+1)
        plt.imshow((predictions[i, :, :, 0]))
        plt.axis('off')
        
    cwd = os.getcwd()
    folder_path = os.path.join(cwd, r'cifar10\generated_samples')
    # plt.savefig(os.path.join(folder_path, 'sample_epoch_{:04d}_iter_{:03d}.png'.format(epoch, it)))

    plt.show()
```

2. 생성 이미지 시각화 및 학습 그래프를 통해 GAN 학습이 바르게 진행되었음을 입증하였다.
```
FMNIST는 생성 후 확인
CIFAR-10은 1에서 언급한 오류로 gif 만드는 의미가 없다고 판단하셨음
학습은 진행되었다고 판단
```

3. 추가적인 GAN 모델구조 혹은 학습과정 개선 아이디어를 제안하고 이를 적용하였다.
```
생성자 모델 개선(con2dTranspose layer 추가, filter 추가, noise 벡터 수정)

A. con2dTranspose layer 추가
def make_generator_model_betav2():
    model = tf.keras.Sequential()

    # First: Dense layer
    model.add(layers.Dense(8*8*256, use_bias=False, input_shape=(100,)))
    model.add(layers.BatchNormalization())
    model.add(layers.LeakyReLU())

    # Second: Reshape layer
    model.add(layers.Reshape((8, 8, 256)))

    # Third: Conv2DTranspose layer
    model.add(layers.Conv2DTranspose(128, (5, 5), strides=(1, 1), padding='same', use_bias=False))
    model.add(layers.BatchNormalization())
    model.add(layers.LeakyReLU())

    # Fourth: Conv2DTranspose layer
    model.add(layers.Conv2DTranspose(128, (5, 5), strides=(1, 1), padding='same', use_bias=False))
    model.add(layers.BatchNormalization())
    model.add(layers.LeakyReLU())
    
    # Fifth
    model.add(layers.Conv2DTranspose(128, (5, 5), strides=(2, 2), padding='same', use_bias=False))
    model.add(layers.BatchNormalization())
    model.add(layers.LeakyReLU())

    # Fifth: Conv2DTranspose layer
    model.add(layers.Conv2DTranspose(3, kernel_size=(5, 5), strides=(2, 2), padding='same', use_bias=False, activation='tanh'))

    return model

```
```
B. Noise vector 수정
# 노이즈 벡터 만들기
# noise_beta = tf.random.normal([1, 255])
noise_dim = 255  # This should match the number of features expected by the generator
batch_size = 256  # This appears to be your batch size

# Generate noise with the correct shape
noise_beta = np.random.normal(size=(batch_size, noise_dim))

```


```
Learning Rate Schedule 적용

# 생성자, 판별자 따로 학습하기 때문에 두개의 optimizer 필
initial_learning_rate = 0.0002
lr_schedule = tf.keras.optimizers.schedules.ExponentialDecay(
    initial_learning_rate,
    decay_steps=1000,
    decay_rate=0.96,
    staircase=True)

generator_optimizer = tf.keras.optimizers.Adam(learning_rate=lr_schedule)
discriminator_optimizer = tf.keras.optimizers.Adam(learning_rate=lr_schedule)

```
  
  
- [v]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.

```
# 노이즈 벡터 만들기
# noise_beta = tf.random.normal([1, 255])
noise_dim = 255  # This should match the number of features expected by the generator
batch_size = 256  # This appears to be your batch size

# Generate noise with the correct shape
noise_betav3 = np.random.normal(size=(batch_size, noise_dim))
```


        
- [v]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.

```
Learning rate schedule 적용, 커널사이즈 변경 등 여러가지 시도를 해봄
기존 커널 사이즈는 5x5 -> 4x4로 변경
```

```
Skip connetion 시도
# ResNet Block 함수
def ResnetSkipBlock(x, filters, kernel_size, strides):
    # Initial input
    initial_x = x

    # First layer of the block
    x = layers.Conv2DTranspose(filters, kernel_size, strides=strides, padding='same', use_bias=False)(x)
    x = layers.BatchNormalization()(x)
    x = layers.LeakyReLU()(x)

    # Second layer of the block
    x = layers.Conv2DTranspose(filters, kernel_size, strides=(1, 1), padding='same', use_bias=False)(x)
    x = layers.BatchNormalization()(x)

    # Adding the skip connection
    x = layers.Add()([x, initial_x])
    x = layers.LeakyReLU()(x)

    return x

```

        
- [v]  **4. 회고를 잘 작성했나요?**
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 기록되어 있는지 확인
    - 전체 코드 실행 플로우를 그래프로 그려서 이해를 돕고 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.

```
많은 걸 시도해봤지만 형태와 accuracy가 잡히지 않아 이 번 노드는 배우는 걸로 넘어가기로 했다ㅠ
```


        
- [v]  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 하드코딩을 하지않고 함수화, 모듈화가 가능한 부분은 함수를 만들거나 클래스로 짰는지
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 함수화했는지
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.

```
# 노이즈 벡터 만들기
# noise_beta = tf.random.normal([1, 255])
noise_dim = 255  # This should match the number of features expected by the generator
batch_size = 256  # This appears to be your batch size

# Generate noise with the correct shape
noise_betav4 = np.random.normal(size=(batch_size, noise_dim))


# 훈련과 추론에서 BatchNorm 행동이달라 Training = False
generated_imagev4 = generator_betav4(noise_betav4, training=False)
generated_imagev4.shape

```


## 참고 링크 및 코드 개선
```
노이즈 벡터 생성 관련 코드를 알려주셨음
https://colab.research.google.com/drive/1r3InSYsSN6BgZdnyCu3vCnpZ1cniKRTJ?usp=sharing#scrollTo=kko6hqBQH6YT
```
