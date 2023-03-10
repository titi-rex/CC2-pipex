/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_get_argv.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tlegrand <tlegrand@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/11 14:19:54 by tlegrand          #+#    #+#             */
/*   Updated: 2023/03/01 13:37:59 by tlegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/pipex.h"

void	ft_get_argv(char **argv, int start, t_pipex *cmd_line)
{
	int	i;

	i = 0;
	while (i < cmd_line->n_cmd)
	{
		cmd_line->cmds[i] = ft_split(argv[i + start], ' ');
		if (!cmd_line->cmds[i])
		{
			ft_error(argv[i + start], &cmd_line->err);
			ft_clean_exit(cmd_line, cmd_line->err);
		}
		i++;
	}
}
