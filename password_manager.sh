#!/bin/bash
while true; do
	echo "パスワードマネージャーへようこそ!"
	echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
	read option

	if [ "$option" = "Add Password" ]; then
		echo "サービス名を入力してください："
		read service_name
		echo "ユーザー名を入力してください："
		read username
		echo "パスワードを入力してください："
		read -s password
		echo "$service_name:$username:$password" >> pass.txt
    echo "パスワードの追加は成功しました。"
	elif [ "$option" = "Get Password" ]; then
		echo "サービス名を入力してください:"
		read service_name
		password=$(grep "^$service_name:" pass.txt | cut -d: -f3)
			if [ -z "$password" ]; then
				echo "そのサービスは登録されていません。"
			else
				echo "サービス名：$service_name"
        echo "ユーザー名：$(grep "^$service_name:" pass.txt | cut -d: -f2)"
        echo "パスワード：$password"
			fi
	elif [ "$option" = "Exit" ]; then
		echo "Thank you!"
		exit
	else
		echo "入力が間違えています。Add Password/Get Password/Exit から入力してください"
	fi
done
