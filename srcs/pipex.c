/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipex.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tlegrand <tlegrand@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/25 14:36:03 by tlegrand          #+#    #+#             */
/*   Updated: 2023/02/26 18:57:58 by tlegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/pipex.h"

static void	ft_man(void);

int	main(int argc, char **argv, char **env)
{
	t_pipex	cmd_line;

	if (argc != 5)
		ft_man();
	else
	{
		cmd_line.env = env;
		cmd_line.err = EXIT_SUCCESS;
		ft_parsing(argv, argc, 2, &cmd_line);
		ft_cmd_master(&cmd_line);
		ft_clean_exit(&cmd_line, cmd_line.err);
	}
	return (0);
}

static void	ft_man(void)
{
	ft_printf("use me correctly u stupid nerd!\n");
	ft_printf("Like that : ./pipex input_file cmd1 cmd2 output_file\n");
	exit(EXIT_FAILURE);
}
